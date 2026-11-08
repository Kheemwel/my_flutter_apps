import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_apps/core/router/routes.dart';
import 'package:my_flutter_apps/core/theme/accent_families.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Brightness brightness = Brightness.dark;

    return MaterialApp.router(
      title: "Kheemwel's Flutter Apps",
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        brightness: brightness,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: brightness,
        ),
        useMaterial3: true,
        extensions: <ThemeExtension<dynamic>>[AccentFamilies.forBrightness(brightness)],
      ),
    );
  }
}
