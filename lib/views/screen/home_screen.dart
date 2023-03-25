import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_structure/view_models/home/home_view_model.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeViewModelProvider);
    final viewModel = ref.watch(HomeViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("押したら+1"),
                  ElevatedButton(
                    onPressed: viewModel.increment,
                    child: Text(data.count.toString()),
                  ),
                  SizedBox(height: 200),
                  TextButton(
                    onPressed: () {
                      print("aaaa");
                      context.push("/details");
                    },
                    child: Text("詳細ページ"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
