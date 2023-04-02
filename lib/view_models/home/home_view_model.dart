import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_structure/repositories/impl/word_list_repository_impl.dart';
import 'package:word_structure/repositories/word_list_repository.dart';

import 'home_state.dart';

final HomeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, AsyncValue<HomeState>>(
  (ref) => HomeViewModel(ref: ref),
);

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  final AutoDisposeStateNotifierProviderRef _ref;

  HomeViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  late final WordListRepository wordListRepository =
      _ref.read(WordListProvider);

  // 初期化
  Future<void> load() async {
    final result = await wordListRepository.fetch();
    result.when(
      success: (data) {
        state = AsyncValue.data(
          HomeState(count: data),
        );
      },
      failure: (error, stacktrace) {
        state = AsyncValue.error(error, stacktrace);
      },
    );
  }

  Future<void> increment() async {
    final count = state.value!.count;

    final result = await wordListRepository.update(count + 1);
    result.when(success: (data) {
      state = AsyncValue.data(HomeState(count: count + 1));
    }, failure: (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    });
  }
}
