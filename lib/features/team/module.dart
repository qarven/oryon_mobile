import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/features/team/team_view.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';

final class TeamModule implements BaseModule {
  static const teamPath = '/team';
  static const teamName = 'team';

  // Nothing to register: the team tab is stateless and reads nothing shared.
  @override
  void initialize() {}

  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: teamName,
      path: teamPath,
      builder: (_, _) => const TeamView(),
    ),
  ];
}
