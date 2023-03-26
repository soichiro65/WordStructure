import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('詳細ページ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <TextButton>[
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
