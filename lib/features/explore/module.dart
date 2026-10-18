import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/features/explore/explore_view.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';

final class ExploreModule implements BaseModule {
  static const explorePath = '/explore';
  static const exploreName = 'explore';

  // Nothing to register: the explore tab is stateless and reads nothing shared.
  @override
  void initialize() {}

  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: exploreName,
      path: explorePath,
      builder: (_, _) => const ExploreView(),
    ),
  ];
}
