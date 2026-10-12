import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_register_event.freezed.dart';

@freezed
sealed class VerifyRegisterEvent with _$VerifyRegisterEvent {
  const factory VerifyRegisterEvent.submitted({
    required String flowId,
    required String code,
    required bool viaPhone,
  }) = VerifyRegisterSubmitted;
}
