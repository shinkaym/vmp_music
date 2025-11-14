import 'package:logger/logger.dart';
import '../constants/app_constants.dart';

/// Application logger instance
class AppLogger {
  static final AppLogger _instance = AppLogger._internal();

  late Logger _logger;

  AppLogger._internal() {
    _initializeLogger();
  }

  factory AppLogger() {
    return _instance;
  }

  /// Initialize the logger with custom configuration
  void _initializeLogger() {
    _logger = Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
      output: ConsoleOutput(),
      level: AppConstants.enableLogs ? Level.debug : Level.off,
    );
  }

  /// Log debug message
  void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log info message
  void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log warning message
  void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log error message
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log fatal/critical error
  void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log method entry
  void methodEntry(String methodName) {
    debug('▶ Entering: $methodName');
  }

  /// Log method exit
  void methodExit(String methodName) {
    debug('◀ Exiting: $methodName');
  }

  /// Log important event
  void event(String eventName, {Map<String, dynamic>? data}) {
    info('📌 Event: $eventName', data);
  }

  /// Log network request
  void networkRequest(String method, String url, {Map<String, dynamic>? headers}) {
    debug('🌐 $method $url', headers);
  }

  /// Log network response
  void networkResponse(String method, String url, int statusCode,
      {dynamic responseBody}) {
    info('✓ $method $url - $statusCode', responseBody);
  }

  /// Log database operation
  void dbOperation(String operation, String table, {dynamic data}) {
    debug('💾 DB $operation on $table', data);
  }

  /// Log cache operation
  void cacheOperation(String operation, String key, {dynamic value}) {
    debug('⚙️ Cache $operation - $key', value);
  }

  /// Close logger
  void close() {
    // Logger cleanup if needed
  }
}

/// Singleton instance
final appLogger = AppLogger();
