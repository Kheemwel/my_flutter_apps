import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void queryChanged(String value) {
    if (state.query == value) return;
    emit(state.copyWith(query: value));
  }

  void tagToggled(String tag) {
    final Set<String> next = Set<String>.of(state.selectedTags);
    if (!next.remove(tag)) {
      next.add(tag);
    }
    emit(state.copyWith(selectedTags: next));
  }

  void cleared() {
    if (!state.hasActiveFilters) return;
    emit(const HomeState());
  }
}
