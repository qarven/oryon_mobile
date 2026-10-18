import 'dart:convert';
import 'dart:developer';

import 'package:oryon_mobile/core/config/app_config.dart';
import 'package:oryon_mobile/core/logging/correlation_id.dart';

/// Emits one JSON object per line so logs stay greppable and machine readable.
/// Every line carries the active [CorrelationId], which is what ties a request,
/// its logs, and the server's view of it together.
abstract final class AppLogger {
  static const String _defaultName = 'OryonMobile';
  static const int _levelDebug = 700;
  static const int _levelInfo = 800;
  static const int _levelWarn = 900;
  static const int _levelError = 1000;
  static bool _initialized = false;

  static void initialize() {
    if (_initialized) return;
    _initialized = true;

    if (AppConfig.isProd) {
      return;
    }

    // do the rest likes:
    // Enable the console UI
    // Initialize specialized loggers
  }

  static void debug(
    String message, {
    String? name,
    Map<String, Object?> data = const {},
  }) {
    if (!AppConfig.isDebugMode) return;
    _log(message, level: _levelDebug, label: 'DEBUG', name: name, data: data);
  }

  static void info(
    String message, {
    String? name,
    Map<String, Object?> data = const {},
  }) {
    if (!AppConfig.isDebugMode) return;
    _log(message, level: _levelInfo, label: 'INFO', name: name, data: data);
  }

  static void warning(
    String message, {
    String? name,
    Map<String, Object?> data = const {},
  }) {
    if (!AppConfig.isDebugMode) return;
    _log(message, level: _levelWarn, label: 'WARN', name: name, data: data);
  }

  // Errors always log: they are the reason the logger exists in production.
  static void error(
    String message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?> data = const {},
  }) => _log(
    message,
    level: _levelError,
    label: 'ERROR',
    name: name,
    data: data,
    error: error,
    stackTrace: stackTrace,
  );

  static void _log(
    String message, {
    required int level,
    required String label,
    String? name,
    Map<String, Object?> data = const {},
    Object? error,
    StackTrace? stackTrace,
  }) {
    final record = <String, Object?>{
      'ts': DateTime.now().toUtc().toIso8601String(),
      'level': label,
      'msg': message,
      if (CorrelationId.current case final id?) 'correlationId': id.value,
      'logger': ?name,
      if (data.isNotEmpty) 'data': data,
      'error': ?error?.toString(),
    };

    log(
      jsonEncode(record),
      name: name ?? _defaultName,
      level: level,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
