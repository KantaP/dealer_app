enum AppRouteAction {
  pushTo,
  pop,
  popUntil,
  popUntilRoot,
  replaceWith,
  replaceAllWith
}

class AppRouteSpec {
  /// The route that the `action` will use to perform the action (push,
  /// replace, pop, etc).
  final String name;

  /// Arguments for the route. Arguments for Pop actions are ignored.
  /// Default empty.
  final dynamic arguments;

  /// Defaults to `AppRouteAction.pushTo`
  final AppRouteAction action;

  const AppRouteSpec({
    required this.name,
    this.arguments,
    this.action = AppRouteAction.pushTo,
  });

  const AppRouteSpec.pop({this.arguments})
      : name = '',
        action = AppRouteAction.pop;

  const AppRouteSpec.popUntilRoot()
      : name = '',
        action = AppRouteAction.popUntilRoot,
        arguments = null;
}
