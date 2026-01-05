import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_archive_app_with_flutter/enums/MenuItem.dart';
import 'package:word_archive_app_with_flutter/pages/Setting.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  final bool showMenu;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
    this.showMenu = false,
  });
  /*
  - Flutter AppBar için standart bir yükseklik verir: kToolbarHeight // = 56.0
  - TabBar’ın da varsayılan yüksekliği vardır: kTextTabBarHeight // = 48.0
  ⭐ Önerilen responsive hesaplama..
    @override
    Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
  */
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack, // Hero'yu kapatır
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
      actions: showMenu
          ? [
              PopupMenuButton<MenuItemType>(
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                ),
                onSelected: (item) {
                  if (item == MenuItemType.setting) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
                  }
                },
                itemBuilder: (context) => MenuItemType.values
                    .map(
                      (value) => PopupMenuItem<MenuItemType>(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
              ),
            ]
          : [],
          /*
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Words"),
              Tab(text: "Add Word"),
            ],
          ),
          */
    );
  }
}

/*

- TabBar → üstte sekmeleri gösterir
- TabBarView → her sekmeye karşılık gelen içeriği gösterir
- İkisi aynı TabController’ı paylaşmak zorundadır
- AppBar yüksekliği normalden büyük olacağı için PreferredSizeWidget gerekir

*/
