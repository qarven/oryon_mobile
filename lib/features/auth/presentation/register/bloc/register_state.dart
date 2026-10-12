import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

enum RegisterStatus { idle, loading, success, failure }

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RegisterStatus.idle) RegisterStatus status,
    @Default(null) Object? error,
    String? flowId,
  }) = _RegisterState;
}

extension RegisterStateX on RegisterState {
  bool get isLoading => status == RegisterStatus.loading;
  bool get isSuccess => status == RegisterStatus.success;
}
