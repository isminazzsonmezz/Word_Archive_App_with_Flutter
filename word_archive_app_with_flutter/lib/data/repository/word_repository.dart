import 'dart:typed_data';

import 'package:drift/drift.dart';

import '../local/app_database.dart';

class WordRepository {
  final AppDatabase db;

  WordRepository(this.db);

  // CREATE
  Future<int> addWord({
    required String english,
    required String turkish,
    required String type,
    String? story,
    Uint8List? imageBytes,
  }) {
    return db.into(db.words).insert(
      WordsCompanion.insert(
        englishWord: english,
        turkishWord: turkish,
        wordType: type,
        story: Value(story),
        imageBytes: Value(imageBytes),
      ),
    );
  }

  // READ (All)
  Future<List<Word>> getAllWords() {
    return db.select(db.words).get();
  }

  Future<List<Word>> getWordsByType(String type) {
  return (db.select(db.words)
        ..where((w) => w.wordType.equals(type))).get();
  }

  Future<List<Word>> getWordsByFavorite(bool value) {
  return (db.select(db.words)
        ..where((w) => w.isFavorite.equals(value))).get();
  }

  Future<List<Word>> getWordsByLearned(bool value) {
  return (db.select(db.words)
        ..where((w) => w.isLearned.equals(value))).get();
  }

  // READ (Stream) - Veri değişince UI otomatik güncellenir
  Stream<List<Word>> watchWords() {
    return db.select(db.words).watch();
  }

  Stream<List<Word>> watchFavoriteWords() {
  return (db.select(db.words)..where((w) => w.isFavorite.equals(true)))
      .watch();
  }

  // UPDATE for isFavorite
  Future<void> toggleFavorite(int id, bool value) {
    return (db.update(db.words)..where((w) => w.id.equals(id)))
        .write(WordsCompanion(isFavorite: Value(value)));
  }

  // UPDATE for isLearned
  Future<void> toggleLearned(int id, bool value) {
    return (db.update(db.words)..where((w) => w.id.equals(id)))
        .write(WordsCompanion(isLearned: Value(value)));
  }

  // DELETE
  Future<void> deleteWord(int id) {
    return (db.delete(db.words)..where((w) => w.id.equals(id))).go();
  }
}
