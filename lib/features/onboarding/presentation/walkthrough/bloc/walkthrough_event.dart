import 'package:freezed_annotation/freezed_annotation.dart';

part 'walkthrough_event.freezed.dart';

@freezed
sealed class WalkthroughEvent with _$WalkthroughEvent {
  const factory WalkthroughEvent.pageChanged(int page) = WalkthroughPageChanged;
  const factory WalkthroughEvent.completed() = WalkthroughCompleted;
}
