import 'app_exception.dart';
import 'logger.dart';

/// Utility class for error handling and conversion
class ErrorHandler {
  /// Convert a generic exception to AppException
  static AppException handleException(dynamic exception, [StackTrace? stackTrace]) {
    if (exception is AppException) {
      return exception;
    }

    appLogger.error(
      'Uncaught exception: ${exception.runtimeType}',
      exception,
      stackTrace,
    );

    if (exception is FormatException) {
      return ValidationException(
        message: exception.message,
        originalException: exception,
        stackTrace: stackTrace,
      );
    }

    if (exception is TimeoutException) {
      return TimeoutException(
        message: 'Operation timed out',
        originalException: exception,
        stackTrace: stackTrace,
      );
    }

    return GeneralException(
      message: exception.toString(),
      originalException: exception,
      stackTrace: stackTrace,
    );
  }

  /// Get user-friendly error message
  static String getErrorMessage(AppException exception) {
    switch (exception.code) {
      case 'network_error':
        return 'Network error. Please check your connection.';
      case 'auth_error':
        return 'Authentication failed. Please try again.';
      case 'auth_failed':
        return 'You do not have permission to perform this action.';
      case 'file_error':
        return 'File operation failed.';
      case 'database_error':
        return 'Database operation failed.';
      case 'validation_error':
        return 'Validation error: ${exception.message}';
      case 'audio_error':
        return 'Audio playback error: ${exception.message}';
      case 'cache_error':
        return 'Cache operation failed.';
      case 'timeout_error':
        return 'Operation timed out. Please try again.';
      default:
        return exception.message;
    }
  }

  /// Log exception with context
  static void logException(
    AppException exception, {
    String? context,
    Map<String, dynamic>? additionalData,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('Exception: ${exception.code}');
    buffer.writeln('Message: ${exception.message}');
    if (context != null) {
      buffer.writeln('Context: $context');
    }
    if (exception.originalException != null) {
      buffer.writeln('Original: ${exception.originalException}');
    }
    if (additionalData != null) {
      buffer.writeln('Data: $additionalData');
    }

    appLogger.error(
      buffer.toString(),
      exception.originalException,
      exception.stackTrace,
    );
  }

  /// Validate result and throw exception if error
  static T validateResult<T>(
    T? result, {
    required String errorMessage,
    String? errorCode,
  }) {
    if (result == null) {
      throw GeneralException(
        message: errorMessage,
        code: errorCode,
      );
    }
    return result;
  }

  /// Safe async operation with error handling
  static Future<T> safeAsync<T>(
    Future<T> Function() operation, {
    String? context,
    required T Function(AppException) onError,
  }) async {
    try {
      if (context != null) {
        appLogger.methodEntry(context);
      }
      final result = await operation();
      if (context != null) {
        appLogger.methodExit(context);
      }
      return result;
    } catch (e, stackTrace) {
      final exception = handleException(e, stackTrace);
      logException(
        exception,
        context: context,
      );
      return onError(exception);
    }
  }

  /// Safe sync operation with error handling
  static T safeSync<T>(
    T Function() operation, {
    String? context,
    required T Function(AppException) onError,
  }) {
    try {
      if (context != null) {
        appLogger.methodEntry(context);
      }
      final result = operation();
      if (context != null) {
        appLogger.methodExit(context);
      }
      return result;
    } catch (e, stackTrace) {
      final exception = handleException(e, stackTrace);
      logException(
        exception,
        context: context,
      );
      return onError(exception);
    }
  }

  /// Assert condition and throw exception if false
  static void assertCondition(
    bool condition, {
    required String message,
    String? code,
  }) {
    if (!condition) {
      throw GeneralException(
        message: message,
        code: code,
      );
    }
  }

  /// Check if value is not null and throw if it is
  static T requireNotNull<T>(
    T? value, {
    required String message,
    String? code,
  }) {
    if (value == null) {
      throw GeneralException(
        message: message,
        code: code,
      );
    }
    return value;
  }
}
