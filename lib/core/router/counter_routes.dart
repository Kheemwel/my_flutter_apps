part of 'routes.dart';

@TypedGoRoute<CounterRoute>(path: '/counter')
class CounterRoute extends GoRouteData with $CounterRoute {
  const CounterRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(key: state.pageKey, child: const CounterPage());
  }
}
