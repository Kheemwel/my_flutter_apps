import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flutter_apps/features/home/presentation/models/app_entry.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String query,
    @Default(<String>{}) Set<String> selectedTags,
  }) = _HomeState;

  const HomeState._();

  bool get hasActiveFilters =>
      query.trim().isNotEmpty || selectedTags.isNotEmpty;
}

extension HomeStateFiltering on HomeState {
  bool matches(AppEntry entry) {
    final String q = query.trim().toLowerCase();
    final bool matchesQuery =
        q.isEmpty ||
        entry.title.toLowerCase().contains(q) ||
        entry.description.toLowerCase().contains(q) ||
        entry.tags.any((String t) => t.toLowerCase().contains(q));
    final bool matchesTags =
        selectedTags.isEmpty || entry.tags.any(selectedTags.contains);
    return matchesQuery && matchesTags;
  }

  List<AppEntry> filter(List<AppEntry> catalog) =>
      catalog.where(matches).toList(growable: false);

  Set<String> collectTags(List<AppEntry> catalog) {
    final Set<String> tags = <String>{};
    for (final AppEntry entry in catalog) {
      tags.addAll(entry.tags);
    }
    return (tags.toList()..sort()).toSet();
  }
}
