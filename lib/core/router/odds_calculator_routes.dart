part of 'routes.dart';

@TypedGoRoute<OddsCalculatorRoute>(path: '/odds-calculator')
class OddsCalculatorRoute extends GoRouteData with $OddsCalculatorRoute {
  const OddsCalculatorRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const OddsCalculatorPage(),
    );
  }
}
