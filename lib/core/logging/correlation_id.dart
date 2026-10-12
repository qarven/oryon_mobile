import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

/// Identifies one logical operation across log lines. Stored in a [Zone] so
/// async gaps keep it without threading a parameter through every call.
@immutable
class CorrelationId {
  const CorrelationId._(this.value);

  /// Reuses an inbound id when present so one trace spans client and server.
  factory CorrelationId.generate({String? inbound}) => CorrelationId._(
    inbound != null && inbound.isNotEmpty ? inbound : _uuid.v4(),
  );

  final String value;

  static const header = 'x-correlation-id';

  static const _key = 'correlationId';
  static const _uuid = Uuid();

  static CorrelationId? get current {
    final value = Zone.current[_key];
    return value is String ? CorrelationId._(value) : null;
  }

  /// Runs [body] with this id active. Async work started inside [body] keeps
  /// it, so later log calls need no extra plumbing.
  static R runWith<R>(CorrelationId id, R Function() body) =>
      Zone.current.fork(zoneValues: {_key: id.value}).run<R>(body);

  @override
  bool operator ==(Object other) =>
      other is CorrelationId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
