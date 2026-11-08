part of 'routes.dart';

@TypedGoRoute<AmountSplitterRoute>(path: '/amount-splitter')
class AmountSplitterRoute extends GoRouteData with $AmountSplitterRoute {
  const AmountSplitterRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const AmountSplitterPage(),
    );
  }
}
