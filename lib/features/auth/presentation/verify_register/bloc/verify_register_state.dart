import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_register_state.freezed.dart';

enum VerifyRegisterStatus { idle, loading, success, failure }

@freezed
sealed class VerifyRegisterState with _$VerifyRegisterState {
  const factory VerifyRegisterState({
    @Default(VerifyRegisterStatus.idle) VerifyRegisterStatus status,
    @Default(null) Object? error,
  }) = _VerifyRegisterState;
}

extension VerifyRegisterStateX on VerifyRegisterState {
  bool get isLoading => status == VerifyRegisterStatus.loading;
  bool get isSuccess => status == VerifyRegisterStatus.success;
}
