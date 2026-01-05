import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_archive_app_with_flutter/data/local/app_database.dart';
import 'package:word_archive_app_with_flutter/data/repository/word_repository.dart';
import 'package:word_archive_app_with_flutter/models/words_view_model.dart';
import 'package:word_archive_app_with_flutter/pages/PageTemplate.dart';
import 'package:word_archive_app_with_flutter/theme/dark_theme.dart';
import 'package:word_archive_app_with_flutter/theme/light_theme.dart';
import 'package:word_archive_app_with_flutter/theme/themeController.dart';

void main() {
    runApp(
      MultiProvider(
        providers: [
          // Theme Provider
          ChangeNotifierProvider(
            create: (_) => ThemeController(),
          ),
          // Database
          Provider<AppDatabase>(
            create: (_) => AppDatabase(),
            dispose: (_, db) => db.close(),
          ),

        // Repository
        Provider<WordRepository>(
          create: (context) {
            final db = context.read<AppDatabase>();
            return WordRepository(db);
          },
        ),

        // ViewModel (GLOBAL)
        ChangeNotifierProvider<WordViewModel>(
          create: (context) {
            final repo = context.read<WordRepository>();
            return WordViewModel(repo);
          },
        ),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    final themeController = context.watch<ThemeController>();

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Archive',

      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: themeController.themeMode, // 🔴 BURASI ŞART

      home: PageTemplate(),
    );
  }
}