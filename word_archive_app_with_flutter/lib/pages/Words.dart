import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:word_archive_app_with_flutter/data/local/app_database.dart';
import 'package:word_archive_app_with_flutter/models/words_view_model.dart';

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {


  Widget buildImage(Uint8List? imageBytes) {
    if (imageBytes == null) {
      return const Icon(Icons.image_not_supported);
    }
    return Image.memory(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<WordViewModel>();

    return Scaffold(
      body: StreamBuilder<List<Word>>(
        stream: vm.wordsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final words = snapshot.data!;
          // debugPrint("VERİ: ${words}");

          if (words.isEmpty) {
            return Center(
              child: Text(
                "No words yet",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              final word = words[index];

              return Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.026),
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
                            FontAwesomeIcons.trash,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Are you sure?"),
                                content: Text(
                                  "This word will be permanently deleted.",
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("Cansel"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  ElevatedButton(
                                    child: Text("Delete"),
                                    onPressed: () {
                                      context.read<WordViewModel>().deleteWord(
                                        word.id,
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.026),
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
                       Center(
                        child: Hero(
                          tag: word.id,
                          child: buildImage(word.imageBytes),
                        )
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
