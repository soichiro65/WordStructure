import 'package:word_structure/models/result/result.dart';

abstract class WordListRepository {
  Future<Result<int>> fetch();

  Future<Result<void>> update(int value);
}
