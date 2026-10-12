import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginStatus { idle, loading, success, failure }

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStatus.idle) LoginStatus status,
    @Default(null) Object? error,
  }) = _LoginState;
}

extension LoginStateX on LoginState {
  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
}
