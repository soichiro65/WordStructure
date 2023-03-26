import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_state.dart';

final HomeViewModelProvider =
    StateNotifierProvider.autoDispose<XXXViewModel, AsyncValue<HomeState>>(
  (ref) => XXXViewModel(ref: ref),
);

class XXXViewModel extends StateNotifier<AsyncValue<HomeState>> {
  final AutoDisposeStateNotifierProviderRef _ref;

  XXXViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // 初期化
  void load() {
    state = const AsyncValue.data(
      HomeState(count: 0),
    );
  }

  // カウントを+1
  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(
      HomeState(count: count + 1),
    );
  }
}
