import 'package:drift/drift.dart';

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get englishWord => text()();

  TextColumn get turkishWord => text()();

  TextColumn get wordType => text()();

  TextColumn get story => text().nullable()();

  BlobColumn get imageBytes => blob().nullable()();

  BoolColumn get isLearned => boolean().withDefault(const Constant(false))();

  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
