/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalException;
  final StackTrace? stackTrace;

  AppException({
    required this.message,
    this.code,
    this.originalException,
    this.stackTrace,
  });

  @override
  String toString() => 'AppException: $message';
}

/// Exception for general application errors
class GeneralException extends AppException {
  GeneralException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code,
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for network-related errors
class NetworkException extends AppException {
  NetworkException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'network_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for authentication-related errors
class AuthenticationException extends AppException {
  AuthenticationException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'auth_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for authorization-related errors
class AuthorizationException extends AppException {
  AuthorizationException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'auth_failed',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for file/IO operations
class FileException extends AppException {
  FileException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'file_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for database operations
class DatabaseException extends AppException {
  DatabaseException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'database_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for validation errors
class ValidationException extends AppException {
  final Map<String, dynamic>? errors;

  ValidationException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
    this.errors,
  }) : super(
    message: message,
    code: code ?? 'validation_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for audio-related errors
class AudioException extends AppException {
  AudioException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'audio_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for cache operations
class CacheException extends AppException {
  CacheException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'cache_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

/// Exception for timeout operations
class TimeoutException extends AppException {
  TimeoutException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'timeout_error',
    originalException: originalException,
    stackTrace: stackTrace,
  );
}
