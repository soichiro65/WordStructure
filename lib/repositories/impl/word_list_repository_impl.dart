import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_structure/models/result/result.dart';
import 'package:word_structure/repositories/word_list_repository.dart';

final WordListProvider =
    Provider<WordListRepository>((ref) => WordListRepositoryImpl());

class WordListRepositoryImpl implements WordListRepository {
  final documentId = "BUDYe5tVklogohv2r19B";

  @override
  Future<Result<int>> fetch() {
    return Result.guardFuture(() async {
      final snapshot = await FirebaseFirestore.instance
          .collection('number')
          .doc(documentId)
          .get();
      return snapshot.get("int");
    });
  }

  @override
  Future<Result<void>> update(int value) {
    return Result.guardFuture(() async {
      await FirebaseFirestore.instance
          .collection('number')
          .doc(documentId)
          .update({'int': value});
    });
  }
}
