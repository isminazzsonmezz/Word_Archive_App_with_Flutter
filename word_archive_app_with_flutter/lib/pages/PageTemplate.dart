import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_archive_app_with_flutter/pages/AddWord.dart';
import 'package:word_archive_app_with_flutter/pages/Home.dart';
import 'package:word_archive_app_with_flutter/pages/Words.dart';
import 'package:word_archive_app_with_flutter/widgets/custom_AppBar_widget.dart';

class PageTemplate extends StatefulWidget {
  const PageTemplate({super.key});

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  @override
  Widget build(BuildContext context) {
    /*
      - length → Tab sayısı
      - TabBarView.children.length ile aynı olmak zorunda
    */
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: "Word Archive", showMenu: true),
        body: TabBarView(
          children: [
            Home(),
            Words(),
            AddWord(),
          ],
        ),

        bottomNavigationBar: Material(

          color: Theme.of(context).appBarTheme.backgroundColor,
          child: TabBar(
            labelColor: Theme.of(context).tabBarTheme.labelColor,
            indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
            tabs: [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.house,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ), text: "Home"),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.bookOpen,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ), 
                text: "Words",
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.circlePlus,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ), text: "Add Word"),
            ],
          ),
        ),
      ),
    );
  }
}
