// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => <RouteBase>[
  $homeRoute,
  $counterRoute,
  $oddsCalculatorRoute,
  $amountSplitterRoute,
];

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $HomeRoute._fromState,
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $counterRoute => GoRouteData.$route(
  path: '/counter',
  hasOverriddenOnExit: false,
  factory: $CounterRoute._fromState,
);

mixin $CounterRoute on GoRouteData {
  static CounterRoute _fromState(GoRouterState state) => const CounterRoute();

  @override
  String get location => GoRouteData.$location('/counter');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $oddsCalculatorRoute => GoRouteData.$route(
  path: '/odds-calculator',
  hasOverriddenOnExit: false,
  factory: $OddsCalculatorRoute._fromState,
);

mixin $OddsCalculatorRoute on GoRouteData {
  static OddsCalculatorRoute _fromState(GoRouterState state) =>
      const OddsCalculatorRoute();

  @override
  String get location => GoRouteData.$location('/odds-calculator');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $amountSplitterRoute => GoRouteData.$route(
  path: '/amount-splitter',
  hasOverriddenOnExit: false,
  factory: $AmountSplitterRoute._fromState,
);

mixin $AmountSplitterRoute on GoRouteData {
  static AmountSplitterRoute _fromState(GoRouterState state) =>
      const AmountSplitterRoute();

  @override
  String get location => GoRouteData.$location('/amount-splitter');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
