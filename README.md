# Kheemwel's Flutter Apps

A single Flutter web app that hosts a growing collection of small, self-contained mini-apps — calculators, converters, and utilities — all under one codebase, one build, and one deployment.

> **Current output target:** Web (Flutter Web). The architecture is platform-agnostic, so mobile/desktop can be added later without restructuring.

---

## Table of Contents

- [What This Is](#what-this-is)
- [Current Mini-Apps](#current-mini-apps)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Architecture Decisions](#architecture-decisions)
- [Routing](#routing)
- [Theming](#theming)
- [State Management](#state-management)
- [Adding a New Mini-App](#adding-a-new-mini-app)
- [Getting Started](#getting-started)
- [Code Generation](#code-generation)
- [Roadmap](#roadmap)

---

## What This Is

This is not a single-purpose app — it's a **platform** for mini-apps. Each tool lives in its own feature folder, with its own state, models, and UI. The home page presents them as a searchable, filterable grid. Adding a new tool means adding one folder and one entry to the catalog; nothing else has to change.

The project is also a **learning ground**, deliberately exercising production-grade patterns (typed routing, Bloc/Cubit, freezed, M3 theming with custom extensions) on a small, low-stakes surface.

---

## Current Mini-Apps

| App                 | Route              | Description                                                                                                                                                          |
| ------------------- | ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Counter**         | `/counter`         | Minimal counter demo — increment, decrement, reset, with a computed "doubled" value.                                                                                 |
| **Odds Calculator** | `/odds-calculator` | Given a per-attempt chance (%), calculates how many attempts are needed to hit target confidence levels (30%, 50%, 90%, 99%).                                        |
| **Amount Splitter** | `/amount-splitter` | Splits a total amount into equal or custom parts. Supports manual halving/removal and auto-distribution with optional decimal precision and "equal parts only" mode. |

---

## Tech Stack

| Concern          | Choice                                                                              |
| ---------------- | ----------------------------------------------------------------------------------- |
| Framework        | Flutter (Material 3)                                                                |
| Target           | Flutter Web                                                                         |
| Routing          | `go_router` + `go_router_builder` (typed routes)                                    |
| State management | `flutter_bloc` — Bloc for event-driven features, Cubit for local UI state           |
| Immutable models | `freezed` (+ `freezed_annotation`)                                                  |
| Theming          | `ColorScheme.fromSeed` + custom `AccentFamily` / `AccentFamilies` `ThemeExtension`s |
| Code generation  | `build_runner`                                                                      |

---

## Project Structure

```
lib/
├── main.dart                         # MaterialApp.router + theme setup
├── core/
│   ├── extensions/
│   │   └── theme_x.dart              # BuildContext shortcuts: colorScheme, textTheme, accentFamilies
│   ├── pages/
│   │   └── not_found_page.dart       # Global 404 fallback
│   ├── router/
│   │   ├── routes.dart               # Router assembly (imports + part directives)
│   │   ├── routes.g.dart             # Generated — do not edit
│   │   ├── home_routes.dart          # Typed route classes (part of routes.dart)
│   │   ├── counter_routes.dart
│   │   ├── odds_calculator_routes.dart
│   │   └── amount_splitter_routes.dart
│   ├── theme/
│   │   ├── accent_families.dart      # ThemeExtension holding one AccentFamily per hue
│   │   └── accent_family.dart        # Curated subset of ColorScheme roles per hue
│   └── utils/
│       └── debouncer.dart            # Reusable debounce helper
└── features/
    ├── home/
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── home_cubit.dart
    │       │   └── home_state.dart   # query + selectedTags + filter() extension
    │       ├── models/
    │       │   ├── app_entry.dart    # Display model for a card
    │       │   └── app_catalog.dart  # buildAppCatalog(context) — the source of truth
    │       └── pages/
    │           └── home_page.dart    # Search bar + filter chips + SliverGrid
    ├── counter/
    │   ├── bloc/                     # CounterBloc / Event / State
    │   └── presentation/pages/
    ├── odds_calculator/
    │   ├── bloc/
    │   └── presentation/
    └── amount_splitter/
        ├── domain/entities/          # SplitPart, SplitterMode
        ├── presentation/
        │   ├── bloc/
        │   └── pages/
        └── services/                 # Pure splitting/formatting functions
```

---

## Architecture Decisions

### Feature-first, not layer-first

Each mini-app is self-contained under `features/<name>/`. When you open a feature folder, everything it needs is there. This scales cleanly as the collection grows — adding the tenth mini-app doesn't touch any of the first nine.

### Simplified Clean Architecture

Full three-layer Clean Architecture (Presentation → Domain → Data) is overkill for calculator/utility apps. Most features skip the Domain layer entirely:

- **Pure calculation tools** (Odds Calculator): logic lives as computed getters on the state.
- **Stateful tools with entities** (Amount Splitter): uses `domain/entities/` for value objects, plus a `services/` folder for pure functions.
- **UI-only state** (Home filters): a Cubit with a freezed state, no repository.

A Data layer can be introduced per-feature when persistence is actually needed — not preemptively.

### Display models live in `presentation/models/`

`AppEntry` and `buildAppCatalog` are presentation models: they depend on Flutter (`IconData`, `BuildContext`, `AccentFamily`) and are only consumed by the home page. They intentionally do **not** live in `domain/` — that would falsely imply business rules and violate dependency direction (domain must not depend on Flutter/theme concepts).

If a future feature needs to persist app IDs (e.g., favorites), the refactor path is to split `AppEntry` into a pure-Dart domain entity plus a presentation-layer decorator. That hasn't been needed yet.

---

## Routing

Routing uses **`go_router_builder`** for compile-time safety. No raw route strings anywhere in the app.

### How it's organized

`routes.dart` is the router assembly point — it imports pages, declares `part` files, and exposes the `GoRouter` instance. Individual route classes live in their own `part` files. This is required by `go_router_builder`: it only recognizes `@TypedGoRoute` annotations within the same Dart library, so routes must be connected via `part`, not `import`.

```dart
// routes.dart
part 'routes.g.dart';
part 'home_routes.dart';
part 'counter_routes.dart';
// ...

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
);
```

```dart
// counter_routes.dart
part of 'routes.dart';

@TypedGoRoute<CounterRoute>(path: '/counter')
class CounterRoute extends GoRouteData with $CounterRoute {
  const CounterRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(key: state.pageKey, child: const CounterPage());
  }
}
```

### Navigation

Never write `context.go('/counter')`. Use the typed route:

```dart
const CounterRoute().go(context);
```

This gives you:

- **Compile-time safety** — a misspelled route class won't compile.
- **Parameter safety** — missing required params are compile errors.
- **Refactor safety** — renaming a path only requires changing the annotation.

### `buildPage` instead of `build`

All routes override `buildPage` to return a `MaterialPage` explicitly. This guarantees Material transition animations on Flutter Web, where `go_router`'s automatic page detection can silently fall back to `NoTransitionPage`.

---

## Theming

Dark mode only, Material 3, built from a single seed color.

### Base theme

`ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark)` in `main.dart`. Scaffold backgrounds default to `surface` (near-black in dark M3) — this is correct M3 behavior, not a bug.

### Accent families

A `ThemeExtension<AccentFamilies>` carries one `AccentFamily` per hue (red, orange, yellow, green, blue, purple, pink). Each `AccentFamily` is a curated subset of `ColorScheme` roles from a single seed:

```dart
context.accentFamilies.blue.primaryContainer
context.accentFamilies.blue.onPrimaryContainer
```

This guarantees contrast pairings hold (they come from the same seed) while letting individual cards/icons use distinct hues. Access via the `ThemeX` extension: `context.accentFamilies.blue`.

### `ThemeX` shortcuts

```dart
context.colorScheme    // Theme.of(context).colorScheme
context.textTheme      // Theme.of(context).textTheme
context.accentFamilies // ThemeExtension lookup with assertion
```

---

## State Management

`flutter_bloc` throughout, with a deliberate Bloc/Cubit split based on the **shape** of the feature, not consistency for its own sake.

| Feature         | Type    | Why                                                                                                     |
| --------------- | ------- | ------------------------------------------------------------------------------------------------------- |
| Counter         | `Bloc`  | Named events — makes the state transitions self-documenting for a learning project.                     |
| Odds Calculator | `Bloc`  | Event-driven input with a `Debouncer`; the event boundary is meaningful.                                |
| Amount Splitter | `Bloc`  | Nine distinct user actions, plus internal ID bookkeeping (`_nextPartId`).                               |
| Home            | `Cubit` | Three direct methods (`queryChanged`, `tagToggled`, `cleared`). Bloc would add ceremony for no benefit. |

### Filtering lives on the state

`HomeState` exposes a `filter(catalog)` extension method. The page calls `state.filter(catalog)` — one line. This keeps the filtering rule:

- **Unit-testable** without a widget tree.
- **Free of `BuildContext`** (the cubit never touches Flutter APIs).
- **Co-located with the state it depends on**.

The catalog itself is built in the page (`buildAppCatalog(context)`) because it needs theme accents and route callbacks.

---

## Adding a New Mini-App

1. **Create the feature folder:**

   ```
   lib/features/my_tool/
   ├── bloc/                    (or cubit/, or nothing for pure-UI)
   ├── domain/entities/         (only if you have real value objects)
   ├── services/                (only if you have pure functions)
   └── presentation/pages/
       └── my_tool_page.dart
   ```

2. **Add a typed route** in `lib/core/router/my_tool_routes.dart`:

   ```dart
   part of 'routes.dart';

   @TypedGoRoute<MyToolRoute>(path: '/my-tool')
   class MyToolRoute extends GoRouteData with $MyToolRoute {
     const MyToolRoute();

     @override
     Page<void> buildPage(BuildContext context, GoRouterState state) {
       return MaterialPage(key: state.pageKey, child: const MyToolPage());
     }
   }
   ```

3. **Wire it into `routes.dart`:**

   ```dart
   import '.../my_tool_page.dart';
   part 'my_tool_routes.dart';
   ```

4. **Add it to the catalog** in `presentation/models/app_catalog.dart`:

   ```dart
   AppEntry(
     title: 'My Tool',
     description: 'What it does.',
     icon: Icons.build,
     tags: const ['Utility'],
     accent: accents.purple,
     route: (c) => const MyToolRoute().go(c),
   ),
   ```

5. **Run code generation** (see below).

6. **Done.** The home grid, search, and filter chips pick it up automatically.

---

## Getting Started

### Prerequisites

- Flutter SDK (stable channel, recent version with Material 3 support)
- Dart SDK (bundled with Flutter)

### Install and run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

### Build for web

```bash
flutter build web --release
```

The output lands in `build/web/`.

---

## Code Generation

This project uses `build_runner` for three generators:

| Generator           | Produces                                                                        |
| ------------------- | ------------------------------------------------------------------------------- |
| `freezed`           | `.freezed.dart` — immutable models, `copyWith`, equality, pattern matching      |
| `go_router_builder` | `routes.g.dart` — `$appRoutes`, `$XxxRoute` mixins, `.go()` / `.push()` methods |

### Commands

```bash
# One-off build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (during active development)
dart run build_runner watch --delete-conflicting-outputs
```

**Never edit `.freezed.dart` or `.g.dart` files manually** — they are regenerated on every build.

### When to re-run

- After adding/modifying a `@freezed` class.
- After adding/modifying a `@TypedGoRoute` annotation.
- After adding a new `part` file to `routes.dart`.

---

## Roadmap

This app is designed to grow. Planned directions (rough priority):

- **More mini-apps** — like unit converter, password generator, color palette tools, date/time utilities, financial calculators.
- **Favorites / recents** — persist favorite apps across sessions (local-first, via `shared_preferences` or `hive`). This would introduce the first real `Data` layer and likely promote `AppEntry` to a domain entity with a presentation decorator.
- **Lazy-loaded mini-apps** — use Flutter Web's deferred loading so each tool is only bundled when opened. Reduces initial bundle size as the collection grows.
- **Search improvements** — fuzzy matching, tag grouping, keyboard shortcuts.
- **Light mode** — the theming system already supports it structurally (`AccentFamilies.forBrightness(Brightness.light)`); it just needs a toggle and a `ThemeMode` source of truth.
- **Per-app deep links** — already supported by `go_router`; will be documented once there's a share feature.

---

## License

Personal project. No license declared yet.
