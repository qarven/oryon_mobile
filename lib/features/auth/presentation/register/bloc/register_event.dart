import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.submitted({
    required String name,
    required String identifier,
    required String password,
    required bool viaPhone,
  }) = RegisterSubmitted;
}
