import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/pages/not_found_page.dart';
import 'package:my_flutter_apps/features/counter/presentation/counter_page.dart';
import 'package:my_flutter_apps/features/home/presentation/home_page.dart';

part 'routes.g.dart';
part 'home_routes.dart';
part 'counter_routes.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes, // The generator aggregates all @TypedGoRoute from the entire library into this
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
);
