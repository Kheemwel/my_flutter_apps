import 'package:flutter/material.dart';
import 'package:my_flutter_apps/core/router/routes.dart';
import 'package:my_flutter_apps/core/theme/accent_families.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brightness = Brightness.dark;

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
        extensions: [AccentFamilies.forBrightness(brightness)],
      ),
    );
  }
}
