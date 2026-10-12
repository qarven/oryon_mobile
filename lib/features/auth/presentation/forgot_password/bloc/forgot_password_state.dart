import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

enum ForgotPasswordStatus { idle, loading, success, failure }

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(ForgotPasswordStatus.idle) ForgotPasswordStatus status,
    @Default(null) Object? error,
  }) = _ForgotPasswordState;
}

extension ForgotPasswordStateX on ForgotPasswordState {
  bool get isLoading => status == ForgotPasswordStatus.loading;
  bool get isSuccess => status == ForgotPasswordStatus.success;
}
