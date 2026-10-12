import 'package:freezed_annotation/freezed_annotation.dart';

part 'walkthrough_state.freezed.dart';

@freezed
sealed class WalkthroughState with _$WalkthroughState {
  const factory WalkthroughState({
    @Default(0) int page,
    @Default(false) bool completed,
  }) = _WalkthroughState;
}
