import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import '../data/repository/word_repository.dart';
import '../data/local/app_database.dart';

/*
  - UI Repository’i ile değil, sadece ViewModel ile konuşur..
  UI → ViewModel → Repository → Drift
*/

class WordViewModel extends ChangeNotifier {
  final WordRepository _repository;

  WordViewModel(this._repository);

  // 🔹 STREAMS (UI dinler)
  Stream<List<Word>> get wordsStream => _repository.watchWords();

  // 🔹 FUTURE READS (filtreli sorgular)
  Future<List<Word>> getAllWords() {
    return _repository.getAllWords();
  }

  Future<List<Word>> getWordsByType(String type) {
    return _repository.getWordsByType(type);
  }

  Stream<List<Word>> get favoriteWordsStream =>
      _repository.watchFavoriteWords();


  Future<List<Word>> getFavoriteWords() {
    return _repository.getWordsByFavorite(true);
  }

  Future<List<Word>> getLearnedWords() {
    return _repository.getWordsByLearned(true);
  }

  // 🔹 CREATE
  Future<void> addWord({
    required String english,
    required String turkish,
    required String type,
    String? story,
    Uint8List? imageBytes,
  }) async {
    await _repository.addWord(
      english: english,
      turkish: turkish,
      type: type,
      story: story,
      imageBytes: imageBytes,
    );
  }

  // 🔹 UPDATE
  Future<void> toggleFavorite(Word word) async {
    await _repository.toggleFavorite(word.id, !word.isFavorite);
  }

  Future<void> toggleLearned(Word word) async {
    await _repository.toggleLearned(word.id, !word.isLearned);
  }

  // 🔹 DELETE
  Future<void> deleteWord(int id) async {
    await _repository.deleteWord(id);
  }
}
