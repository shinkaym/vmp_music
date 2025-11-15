import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:vmp_music/core/error/app_exception.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Enum for permission types
enum PermissionType {
  storage,
  audio,
  microphone,
  notification,
}

/// Model for permission status
class PermissionStatus {
  final PermissionType type;
  final bool isGranted;
  final bool isDenied;
  final bool isPermanentlyDenied;

  PermissionStatus({
    required this.type,
    required this.isGranted,
    required this.isDenied,
    required this.isPermanentlyDenied,
  });

  /// Check if permission needs to be requested
  bool get needsRequest => !isGranted && !isPermanentlyDenied;

  /// Check if we should show rationale
  bool get shouldShowRationale => isDenied && !isPermanentlyDenied;
}

/// Service for handling app permissions
class PermissionService {
  static final PermissionService _instance = PermissionService._internal();

  PermissionService._internal();

  factory PermissionService() {
    return _instance;
  }

  /// Request storage permission
  /// Returns true if permission is granted
  Future<bool> requestStoragePermission() async {
    try {
      final status = await _getStoragePermission();

      if (status.isDenied) {
        final result = await Permission.storage.request();
        appLogger.info('Storage permission result: $result');
        return result.isGranted;
      }

      if (status.isPermanentlyDenied) {
        appLogger.warning('Storage permission is permanently denied');
        return false;
      }

      return status.isGranted;
    } catch (e) {
      appLogger.error('Error requesting storage permission', e);
      throw AuthorizationException(
        message: 'Failed to request storage permission: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Request audio permission (microphone)
  /// Returns true if permission is granted
  Future<bool> requestAudioPermission() async {
    try {
      final status = await Permission.microphone.status;

      if (status.isDenied) {
        final result = await Permission.microphone.request();
        appLogger.info('Audio permission result: $result');
        return result.isGranted;
      }

      if (status.isPermanentlyDenied) {
        appLogger.warning('Audio permission is permanently denied');
        return false;
      }

      return status.isGranted;
    } catch (e) {
      appLogger.error('Error requesting audio permission', e);
      throw AuthorizationException(
        message: 'Failed to request audio permission: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Request notification permission
  /// Returns true if permission is granted
  Future<bool> requestNotificationPermission() async {
    try {
      // Notification permission is only needed on Android 13+
      if (!Platform.isAndroid) {
        return true;
      }

      final status = await Permission.notification.status;

      if (status.isDenied) {
        final result = await Permission.notification.request();
        appLogger.info('Notification permission result: $result');
        return result.isGranted;
      }

      if (status.isPermanentlyDenied) {
        appLogger.warning('Notification permission is permanently denied');
        return false;
      }

      return status.isGranted;
    } catch (e) {
      appLogger.error('Error requesting notification permission', e);
      throw AuthorizationException(
        message: 'Failed to request notification permission: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Request all required permissions for music player
  /// Returns true if all permissions are granted
  Future<bool> requestAllPermissions() async {
    try {
      final storageGranted = await requestStoragePermission();
      final notificationGranted = await requestNotificationPermission();

      final allGranted = storageGranted && notificationGranted;

      appLogger.info('All permissions granted: $allGranted');
      return allGranted;
    } catch (e) {
      appLogger.error('Error requesting all permissions', e);
      throw AuthorizationException(
        message: 'Failed to request permissions: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Check storage permission status
  Future<PermissionStatus> checkStoragePermission() async {
    try {
      final status = await _getStoragePermission();
      return PermissionStatus(
        type: PermissionType.storage,
        isGranted: status.isGranted,
        isDenied: status.isDenied,
        isPermanentlyDenied: status.isPermanentlyDenied,
      );
    } catch (e) {
      appLogger.error('Error checking storage permission', e);
      throw AuthorizationException(
        message: 'Failed to check storage permission: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Check audio permission status
  Future<PermissionStatus> checkAudioPermission() async {
    try {
      final status = await Permission.microphone.status;
      return PermissionStatus(
        type: PermissionType.audio,
        isGranted: status.isGranted,
        isDenied: status.isDenied,
        isPermanentlyDenied: status.isPermanentlyDenied,
      );
    } catch (e) {
      appLogger.error('Error checking audio permission', e);
      throw AuthorizationException(
        message: 'Failed to check audio permission: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Check notification permission status
  Future<PermissionStatus> checkNotificationPermission() async {
    try {
      final status = await Permission.notification.status;
      return PermissionStatus(
        type: PermissionType.notification,
        isGranted: status.isGranted,
        isDenied: status.isDenied,
        isPermanentlyDenied: status.isPermanentlyDenied,
      );
    } catch (e) {
      appLogger.error('Error checking notification permission', e);
      throw AuthorizationException(
        message: 'Failed to check notification permission: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Open app settings
  /// User can manually enable denied permissions
  Future<void> openAppSettings() async {
    try {
      await openAppSettings();
      appLogger.info('App settings opened');
    } catch (e) {
      appLogger.error('Error opening app settings', e);
      throw AuthorizationException(
        message: 'Failed to open app settings: $e',
        originalException: e,
      );
    }
  }

  /// Get storage permission based on platform
  /// Android: Handles both internal and external storage
  /// iOS: Uses generic storage permission
  Future<PermissionStatus> _getStoragePermission() async {
    if (Platform.isAndroid) {
      // For Android 11+, use manage external storage
      final androidVersion = int.tryParse(
        (await _getAndroidVersion()).split('.').first,
      );

      if (androidVersion != null && androidVersion >= 11) {
        final status = await Permission.manageExternalStorage.status;
        return PermissionStatus(
          type: PermissionType.storage,
          isGranted: status.isGranted,
          isDenied: status.isDenied,
          isPermanentlyDenied: status.isPermanentlyDenied,
        );
      } else {
        // For Android 10 and below, use read/write storage
        final status = await Permission.storage.status;
        return PermissionStatus(
          type: PermissionType.storage,
          isGranted: status.isGranted,
          isDenied: status.isDenied,
          isPermanentlyDenied: status.isPermanentlyDenied,
        );
      }
    } else {
      // iOS
      final status = await Permission.storage.status;
      return PermissionStatus(
        type: PermissionType.storage,
        isGranted: status.isGranted,
        isDenied: status.isDenied,
        isPermanentlyDenied: status.isPermanentlyDenied,
      );
    }
  }

  /// Get Android version
  Future<String> _getAndroidVersion() async {
    try {
      // This is a simplified version - in production, use device_info_plus
      return Platform.version;
    } catch (e) {
      appLogger.warning('Failed to get Android version', e);
      return '10.0.0'; // Default fallback
    }
  }
}
