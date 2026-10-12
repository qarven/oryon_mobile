import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/onboarding/presentation/walkthrough/bloc/walkthrough_event.dart';
import 'package:oryon_mobile/features/onboarding/presentation/walkthrough/bloc/walkthrough_state.dart';
import 'package:oryon_mobile/features/onboarding/services/onboarding_storage.dart';

class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState> {
  WalkthroughBloc(this._storage) : super(const WalkthroughState()) {
    on<WalkthroughPageChanged>(_onPageChanged);
    on<WalkthroughCompleted>(_onCompleted);
  }
  final OnboardingStorage _storage;
  static const maxPage = 2;

  // The PageView needs one controller for its whole life, and the bloc already
  // tracks the current page. The module creates it per walkthrough route, so it
  // dies with the screen and close() below frees it.
  final _pages = PageController();
  PageController get pages => _pages;

  @override
  Future<void> close() {
    _pages.dispose();
    return super.close();
  }

  void _onPageChanged(
    WalkthroughPageChanged event,
    Emitter<WalkthroughState> emit,
  ) {
    if (event.page < 0 || event.page > maxPage) return;
    emit(state.copyWith(page: event.page));
  }

  Future<void> _onCompleted(
    WalkthroughCompleted event,
    Emitter<WalkthroughState> emit,
  ) async {
    await _storage.write();
    emit(state.copyWith(completed: true));
  }
}
