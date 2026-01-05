// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _englishWordMeta = const VerificationMeta(
    'englishWord',
  );
  @override
  late final GeneratedColumn<String> englishWord = GeneratedColumn<String>(
    'english_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _turkishWordMeta = const VerificationMeta(
    'turkishWord',
  );
  @override
  late final GeneratedColumn<String> turkishWord = GeneratedColumn<String>(
    'turkish_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordTypeMeta = const VerificationMeta(
    'wordType',
  );
  @override
  late final GeneratedColumn<String> wordType = GeneratedColumn<String>(
    'word_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _storyMeta = const VerificationMeta('story');
  @override
  late final GeneratedColumn<String> story = GeneratedColumn<String>(
    'story',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageBytesMeta = const VerificationMeta(
    'imageBytes',
  );
  @override
  late final GeneratedColumn<Uint8List> imageBytes = GeneratedColumn<Uint8List>(
    'image_bytes',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLearnedMeta = const VerificationMeta(
    'isLearned',
  );
  @override
  late final GeneratedColumn<bool> isLearned = GeneratedColumn<bool>(
    'is_learned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_learned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    englishWord,
    turkishWord,
    wordType,
    story,
    imageBytes,
    isLearned,
    isFavorite,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(
    Insertable<Word> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('english_word')) {
      context.handle(
        _englishWordMeta,
        englishWord.isAcceptableOrUnknown(
          data['english_word']!,
          _englishWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishWordMeta);
    }
    if (data.containsKey('turkish_word')) {
      context.handle(
        _turkishWordMeta,
        turkishWord.isAcceptableOrUnknown(
          data['turkish_word']!,
          _turkishWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_turkishWordMeta);
    }
    if (data.containsKey('word_type')) {
      context.handle(
        _wordTypeMeta,
        wordType.isAcceptableOrUnknown(data['word_type']!, _wordTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_wordTypeMeta);
    }
    if (data.containsKey('story')) {
      context.handle(
        _storyMeta,
        story.isAcceptableOrUnknown(data['story']!, _storyMeta),
      );
    }
    if (data.containsKey('image_bytes')) {
      context.handle(
        _imageBytesMeta,
        imageBytes.isAcceptableOrUnknown(data['image_bytes']!, _imageBytesMeta),
      );
    }
    if (data.containsKey('is_learned')) {
      context.handle(
        _isLearnedMeta,
        isLearned.isAcceptableOrUnknown(data['is_learned']!, _isLearnedMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      englishWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_word'],
      )!,
      turkishWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}turkish_word'],
      )!,
      wordType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_type'],
      )!,
      story: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}story'],
      ),
      imageBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}image_bytes'],
      ),
      isLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_learned'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final String englishWord;
  final String turkishWord;
  final String wordType;
  final String? story;
  final Uint8List? imageBytes;
  final bool isLearned;
  final bool isFavorite;
  final DateTime createdAt;
  const Word({
    required this.id,
    required this.englishWord,
    required this.turkishWord,
    required this.wordType,
    this.story,
    this.imageBytes,
    required this.isLearned,
    required this.isFavorite,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['english_word'] = Variable<String>(englishWord);
    map['turkish_word'] = Variable<String>(turkishWord);
    map['word_type'] = Variable<String>(wordType);
    if (!nullToAbsent || story != null) {
      map['story'] = Variable<String>(story);
    }
    if (!nullToAbsent || imageBytes != null) {
      map['image_bytes'] = Variable<Uint8List>(imageBytes);
    }
    map['is_learned'] = Variable<bool>(isLearned);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      englishWord: Value(englishWord),
      turkishWord: Value(turkishWord),
      wordType: Value(wordType),
      story: story == null && nullToAbsent
          ? const Value.absent()
          : Value(story),
      imageBytes: imageBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(imageBytes),
      isLearned: Value(isLearned),
      isFavorite: Value(isFavorite),
      createdAt: Value(createdAt),
    );
  }

  factory Word.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      englishWord: serializer.fromJson<String>(json['englishWord']),
      turkishWord: serializer.fromJson<String>(json['turkishWord']),
      wordType: serializer.fromJson<String>(json['wordType']),
      story: serializer.fromJson<String?>(json['story']),
      imageBytes: serializer.fromJson<Uint8List?>(json['imageBytes']),
      isLearned: serializer.fromJson<bool>(json['isLearned']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'englishWord': serializer.toJson<String>(englishWord),
      'turkishWord': serializer.toJson<String>(turkishWord),
      'wordType': serializer.toJson<String>(wordType),
      'story': serializer.toJson<String?>(story),
      'imageBytes': serializer.toJson<Uint8List?>(imageBytes),
      'isLearned': serializer.toJson<bool>(isLearned),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Word copyWith({
    int? id,
    String? englishWord,
    String? turkishWord,
    String? wordType,
    Value<String?> story = const Value.absent(),
    Value<Uint8List?> imageBytes = const Value.absent(),
    bool? isLearned,
    bool? isFavorite,
    DateTime? createdAt,
  }) => Word(
    id: id ?? this.id,
    englishWord: englishWord ?? this.englishWord,
    turkishWord: turkishWord ?? this.turkishWord,
    wordType: wordType ?? this.wordType,
    story: story.present ? story.value : this.story,
    imageBytes: imageBytes.present ? imageBytes.value : this.imageBytes,
    isLearned: isLearned ?? this.isLearned,
    isFavorite: isFavorite ?? this.isFavorite,
    createdAt: createdAt ?? this.createdAt,
  );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      englishWord: data.englishWord.present
          ? data.englishWord.value
          : this.englishWord,
      turkishWord: data.turkishWord.present
          ? data.turkishWord.value
          : this.turkishWord,
      wordType: data.wordType.present ? data.wordType.value : this.wordType,
      story: data.story.present ? data.story.value : this.story,
      imageBytes: data.imageBytes.present
          ? data.imageBytes.value
          : this.imageBytes,
      isLearned: data.isLearned.present ? data.isLearned.value : this.isLearned,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('englishWord: $englishWord, ')
          ..write('turkishWord: $turkishWord, ')
          ..write('wordType: $wordType, ')
          ..write('story: $story, ')
          ..write('imageBytes: $imageBytes, ')
          ..write('isLearned: $isLearned, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    englishWord,
    turkishWord,
    wordType,
    story,
    $driftBlobEquality.hash(imageBytes),
    isLearned,
    isFavorite,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.englishWord == this.englishWord &&
          other.turkishWord == this.turkishWord &&
          other.wordType == this.wordType &&
          other.story == this.story &&
          $driftBlobEquality.equals(other.imageBytes, this.imageBytes) &&
          other.isLearned == this.isLearned &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<String> englishWord;
  final Value<String> turkishWord;
  final Value<String> wordType;
  final Value<String?> story;
  final Value<Uint8List?> imageBytes;
  final Value<bool> isLearned;
  final Value<bool> isFavorite;
  final Value<DateTime> createdAt;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.englishWord = const Value.absent(),
    this.turkishWord = const Value.absent(),
    this.wordType = const Value.absent(),
    this.story = const Value.absent(),
    this.imageBytes = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String englishWord,
    required String turkishWord,
    required String wordType,
    this.story = const Value.absent(),
    this.imageBytes = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : englishWord = Value(englishWord),
       turkishWord = Value(turkishWord),
       wordType = Value(wordType);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<String>? englishWord,
    Expression<String>? turkishWord,
    Expression<String>? wordType,
    Expression<String>? story,
    Expression<Uint8List>? imageBytes,
    Expression<bool>? isLearned,
    Expression<bool>? isFavorite,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (englishWord != null) 'english_word': englishWord,
      if (turkishWord != null) 'turkish_word': turkishWord,
      if (wordType != null) 'word_type': wordType,
      if (story != null) 'story': story,
      if (imageBytes != null) 'image_bytes': imageBytes,
      if (isLearned != null) 'is_learned': isLearned,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  WordsCompanion copyWith({
    Value<int>? id,
    Value<String>? englishWord,
    Value<String>? turkishWord,
    Value<String>? wordType,
    Value<String?>? story,
    Value<Uint8List?>? imageBytes,
    Value<bool>? isLearned,
    Value<bool>? isFavorite,
    Value<DateTime>? createdAt,
  }) {
    return WordsCompanion(
      id: id ?? this.id,
      englishWord: englishWord ?? this.englishWord,
      turkishWord: turkishWord ?? this.turkishWord,
      wordType: wordType ?? this.wordType,
      story: story ?? this.story,
      imageBytes: imageBytes ?? this.imageBytes,
      isLearned: isLearned ?? this.isLearned,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (englishWord.present) {
      map['english_word'] = Variable<String>(englishWord.value);
    }
    if (turkishWord.present) {
      map['turkish_word'] = Variable<String>(turkishWord.value);
    }
    if (wordType.present) {
      map['word_type'] = Variable<String>(wordType.value);
    }
    if (story.present) {
      map['story'] = Variable<String>(story.value);
    }
    if (imageBytes.present) {
      map['image_bytes'] = Variable<Uint8List>(imageBytes.value);
    }
    if (isLearned.present) {
      map['is_learned'] = Variable<bool>(isLearned.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('englishWord: $englishWord, ')
          ..write('turkishWord: $turkishWord, ')
          ..write('wordType: $wordType, ')
          ..write('story: $story, ')
          ..write('imageBytes: $imageBytes, ')
          ..write('isLearned: $isLearned, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WordsTable words = $WordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words];
}

typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      required String englishWord,
      required String turkishWord,
      required String wordType,
      Value<String?> story,
      Value<Uint8List?> imageBytes,
      Value<bool> isLearned,
      Value<bool> isFavorite,
      Value<DateTime> createdAt,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      Value<String> englishWord,
      Value<String> turkishWord,
      Value<String> wordType,
      Value<String?> story,
      Value<Uint8List?> imageBytes,
      Value<bool> isLearned,
      Value<bool> isFavorite,
      Value<DateTime> createdAt,
    });

class $$WordsTableFilterComposer extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishWord => $composableBuilder(
    column: $table.englishWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get turkishWord => $composableBuilder(
    column: $table.turkishWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wordType => $composableBuilder(
    column: $table.wordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get story => $composableBuilder(
    column: $table.story,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get imageBytes => $composableBuilder(
    column: $table.imageBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishWord => $composableBuilder(
    column: $table.englishWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get turkishWord => $composableBuilder(
    column: $table.turkishWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wordType => $composableBuilder(
    column: $table.wordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get story => $composableBuilder(
    column: $table.story,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get imageBytes => $composableBuilder(
    column: $table.imageBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get englishWord => $composableBuilder(
    column: $table.englishWord,
    builder: (column) => column,
  );

  GeneratedColumn<String> get turkishWord => $composableBuilder(
    column: $table.turkishWord,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wordType =>
      $composableBuilder(column: $table.wordType, builder: (column) => column);

  GeneratedColumn<String> get story =>
      $composableBuilder(column: $table.story, builder: (column) => column);

  GeneratedColumn<Uint8List> get imageBytes => $composableBuilder(
    column: $table.imageBytes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLearned =>
      $composableBuilder(column: $table.isLearned, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordsTable,
          Word,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
          Word,
          PrefetchHooks Function()
        > {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> englishWord = const Value.absent(),
                Value<String> turkishWord = const Value.absent(),
                Value<String> wordType = const Value.absent(),
                Value<String?> story = const Value.absent(),
                Value<Uint8List?> imageBytes = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => WordsCompanion(
                id: id,
                englishWord: englishWord,
                turkishWord: turkishWord,
                wordType: wordType,
                story: story,
                imageBytes: imageBytes,
                isLearned: isLearned,
                isFavorite: isFavorite,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String englishWord,
                required String turkishWord,
                required String wordType,
                Value<String?> story = const Value.absent(),
                Value<Uint8List?> imageBytes = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => WordsCompanion.insert(
                id: id,
                englishWord: englishWord,
                turkishWord: turkishWord,
                wordType: wordType,
                story: story,
                imageBytes: imageBytes,
                isLearned: isLearned,
                isFavorite: isFavorite,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordsTable,
      Word,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (Word, BaseReferences<_$AppDatabase, $WordsTable, Word>),
      Word,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
}
