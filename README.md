# Kheemwel's Flutter Apps

A single Flutter web app hosting a growing collection of small, self-contained mini-apps — calculators, converters, and utilities — in one codebase, one build, one deployment.

> **Target:** Flutter Web. Architecture is platform-agnostic; mobile/desktop can be added later.

---

## Mini-Apps

| App                 | Route              | Description                                                           |
| ------------------- | ------------------ | --------------------------------------------------------------------- |
| **Counter**         | `/counter`         | Increment / decrement / reset, with a computed "doubled" value.       |
| **Odds Calculator** | `/odds-calculator` | Attempts needed to hit 30% / 50% / 90% / 99% confidence for a chance. |
| **Amount Splitter** | `/amount-splitter` | Split an amount into manual or auto-distributed parts.                |

---

## Tech Stack

| Concern          | Choice                                                     |
| ---------------- | ---------------------------------------------------------- |
| Framework        | Flutter (Material 3)                                       |
| Target           | Flutter Web                                                |
| Routing          | `go_router` + `go_router_builder` (typed routes)           |
| State management | `flutter_riverpod` + `riverpod_generator` (`@riverpod`)    |
| Models           | `freezed`                                                  |
| Theming          | `ColorScheme.fromSeed` + custom `AccentFamilies` extension |
| Code generation  | `build_runner`                                             |

---

## Structure

```
lib/
├── main.dart                     # ProviderScope + MaterialApp.router
├── core/
│   ├── extensions/theme_x.dart   # colorScheme, textTheme, accentFamilies shortcuts
│   ├── pages/not_found_page.dart # 404 fallback
│   ├── router/                   # routes.dart + part files + generated routes
│   ├── theme/                    # AccentFamily / AccentFamilies extensions
│   └── utils/debouncer.dart
└── features/
    └── <feature>/
        ├── domain/entities/      (optional: value objects)
        ├── services/             (optional: pure functions)
        └── presentation/
            ├── notifier/         # @riverpod notifier + generated .g.dart
            ├── state/            # freezed state + generated .freezed.dart
            └── pages/
```

---

## Adding a Mini-App

1. Create `lib/features/my_tool/` with `presentation/{notifier,state,pages}/`.
2. Write `my_tool_state.dart` (`@freezed`) and `my_tool_notifier.dart` (`@riverpod`).
3. Add a typed route in `core/router/my_tool_routes.dart` (`part of 'routes.dart'`), then add `part 'my_tool_routes.dart';` to `routes.dart`.
4. Add an `AppEntry` to `presentation/models/app_catalog.dart`.
5. Run code generation.

The home grid, search, and filter chips pick it up automatically.

---

## Commands

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # one-off
dart run build_runner watch --delete-conflicting-outputs   # during dev
flutter run -d chrome
flutter build web --release
```

**Never edit generated files** (`.freezed.dart`, `routes.g.dart`, `<notifier>.g.dart`). Re-run `build_runner` after changing a `@freezed` class, `@TypedGoRoute` annotation, `@riverpod` class, or `part` list.

---

## Roadmap

- More mini-apps (unit converter, password generator, date/time, financial)
- Favorites / recents (first `Data` layer, via `AsyncNotifier` + `shared_preferences`)
- Deferred loading for mini-apps (smaller initial web bundle)
- Fuzzy search, keyboard shortcuts
- Light mode (the theming already supports it; needs a toggle + `ThemeMode` source)
