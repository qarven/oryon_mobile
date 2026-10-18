import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/features/profile/data/repositories/mock_profile_repository.dart';
import 'package:oryon_mobile/features/profile/domain/repositories/profile_repository.dart';
import 'package:oryon_mobile/features/profile/profile_view.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';

final class ProfileModule implements BaseModule {
  static const profilePath = '/profile';

  static const profileName = 'profile';

  @override
  void initialize() {
    GetIt.instance.registerSingleton<ProfileRepository>(
      const MockProfileRepository(),
    );
  }

  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: profileName,
      path: profilePath,
      builder: (_, _) => const ProfileView(),
    ),
  ];
}
