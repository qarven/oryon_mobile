import 'package:go_router/go_router.dart';

/// The contract every feature module follows.
///
/// The app layer treats modules uniformly: it initializes each one, then
/// collects the routes they own. That order matters, because the router guard
/// can ask a module for state the moment it builds its first page, so
/// everything [initialize] registers has to be readable by then.
///
/// Modules stay independent of each other, so anything shared travels through
/// GetIt rather than one module reaching into another.
abstract interface class BaseModule {
  /// Registers this module's own dependencies.
  void initialize();

  /// The routes this module owns. Read after [initialize].
  List<RouteBase> get routes;
}
