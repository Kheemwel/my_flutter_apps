import 'package:my_flutter_apps/features/home/presentation/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  void queryChanged(String value) {
    if (state.query == value) return;
    state = state.copyWith(query: value);
  }

  void tagToggled(String tag) {
    final Set<String> next = Set<String>.of(state.selectedTags);
    if (!next.remove(tag)) {
      next.add(tag);
    }
    state = state.copyWith(selectedTags: next);
  }

  void cleared() {
    if (!state.hasActiveFilters) return;
    state = const HomeState();
  }
}
