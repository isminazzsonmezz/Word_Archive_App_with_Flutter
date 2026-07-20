import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_archive_app_with_flutter/theme/themeController.dart';
import 'package:word_archive_app_with_flutter/widgets/custom_AppBar_widget.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final List<String> languages = ["Device Default", "TR", "EN"];

    return Scaffold(
      appBar: CustomAppBar(title: "Settings", showMenu: true, showBack: true),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.04),
            SwitchListTile(
              title: const Text("Dark Mode"),
              subtitle: const Text("Application mode"),
              value: context.watch<ThemeController>().isDark,
              onChanged: (value) {
                context.read<ThemeController>().toggleTheme();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.04),
            SwitchListTile(
              title: const Text("Show Search History"),
              value: false,
              onChanged: (value) {
                value = value;
              },
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select the language',
                border: OutlineInputBorder(),
              ),
              items: languages
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang, 
                      child: Text(
                        lang,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
