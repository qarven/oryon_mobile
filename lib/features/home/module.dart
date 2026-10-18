import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/features/home/home_page.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';

final class HomeModule implements BaseModule {
  static const rootPath = '/';
  static const rootName = 'home';

  // Nothing to register: the home pages are stateless and read nothing shared.
  @override
  void initialize() {}

  // Mounted by the bottom navigation shell, see AppRouter.initialize.
  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: rootName,
      path: rootPath,
      builder: (_, _) => const HomePage(),
    ),
  ];
}
