import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:oryon_mobile/features/onboarding/presentation/pages/walkthrough_page.dart';
import 'package:oryon_mobile/features/onboarding/services/onboarding_storage.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class OnboardingModule implements BaseModule {
  static const walkthroughPath = '/onboarding';
  static const walkthroughName = 'onboarding';

  @override
  void initialize() => {
    GetIt.instance.registerSingleton<OnboardingStorage>(
      OnboardingStorage(GetIt.instance<SharedPreferences>()),
    ),
  };

  static bool get isFirstTime =>
      !GetIt.instance<OnboardingStorage>().hasCompleted();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: walkthroughName,
      path: walkthroughPath,
      builder: (_, _) => BlocProvider(
        create: (_) => OnboardingBloc(GetIt.instance<OnboardingStorage>()),
        child: const WalkthroughPage(),
      ),
    ),
  ];
}
