import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:word_archive_app_with_flutter/data/local/app_database.dart';
import 'package:word_archive_app_with_flutter/models/words_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<WordViewModel>();

    return Scaffold(
      body: StreamBuilder<List<Word>>(
        stream: vm.favoriteWordsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final favoriteWords = snapshot.data!;
          // debugPrint("VERİ: ${words}");

          if (favoriteWords.isEmpty) {
            return Center(
              child: Text(
                "No words yet",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.builder(
            itemCount: favoriteWords.length,
            itemBuilder: (context, index) {
              final word = favoriteWords[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: Text(word.englishWord.toUpperCase()),
                    subtitle: Text(word.turkishWord),
                    trailing: Wrap(
                      spacing: 3,
                      children: [
                        IconButton(
                          icon: Icon(
                            word.isLearned
                                ? FontAwesomeIcons.solidThumbsUp
                                : FontAwesomeIcons.thumbsUp,
                            color: word.isLearned
                                ? Colors.green
                                : Colors.redAccent,
                          ),
                          onPressed: () {
                            // debugPrint("learned tıklandı");
                            context.read<WordViewModel>().toggleLearned(word);
                          },
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            word.isFavorite
                                ? FontAwesomeIcons.solidStar
                                : FontAwesomeIcons.star,
                            color: word.isFavorite
                                ? Colors.amber
                                : Colors.black,
                          ),
                          onPressed: () {
                            // debugPrint("favorite tıklandı");
                            context.read<WordViewModel>().toggleFavorite(word);
                          },
                        ),
                      ],
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          "Ex. ${(word.story == null || word.story!.isEmpty) ? " - " : word.story!}",
                        ),
                        subtitle: Text("- ${word.wordType}"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
