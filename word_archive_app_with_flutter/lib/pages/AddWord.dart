import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:word_archive_app_with_flutter/enums/WordItem.dart';
import 'package:word_archive_app_with_flutter/models/words_view_model.dart';

class AddWord extends StatefulWidget {
  const AddWord({super.key});

  @override
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedType;

  final _englishController = TextEditingController();
  final _turkishController = TextEditingController();
  final _storyController = TextEditingController();

  Uint8List? _imageBytes;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  @override
  void dispose() {
    _englishController.dispose();
    _turkishController.dispose();
    _storyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModel
    final vm = context.read<WordViewModel>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Add new word",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              TextFormField(
                controller: _englishController,
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "English Word",
                  hintText: "Please Enter the Word",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              TextFormField(
                controller: _turkishController,
                autovalidateMode: AutovalidateMode.onUnfocus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Turkish Word",
                  hintText: "Please Enter the Word",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              TextFormField(
                controller: _storyController,
                onSaved: (newValue) {},
                minLines: 4,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Story",
                  hintText: "Please Enter Story about the Word",
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              DropdownButtonFormField<WordType>(
                decoration: const InputDecoration(
                  labelText: 'Select the Type', // (isimlendirme aşağıda)
                  border: OutlineInputBorder(),
                ),
                value: WordType.values.first,
                items: WordType.values.map((type) {
                  return DropdownMenuItem<WordType>(
                    value: type,
                    child: Text(
                      type.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _selectedType = value.toString());
                },
                validator: (value) {
                  if (value == null) {
                    return "Please selected the type";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25, // %25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                  ),
                  child: _imageBytes == null
                      ? Center(
                          child: Text(
                            'Select the Photo'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                      : Image.memory(_imageBytes!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_englishController.text.trim().isEmpty ||
                      _turkishController.text.trim().isEmpty) {
                    // Alanlardan en az biri boş
                    // mesaj
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please enter both English and Turkish words.",
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  await vm.addWord(
                    english: _englishController.text,
                    turkish: _turkishController.text,
                    story: _storyController.text,
                    type: _selectedType.toString(),
                    imageBytes: _imageBytes,
                  );

                  // mesaj
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("The word was defined."),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // alanları temizle
                  _englishController.clear();
                  _turkishController.clear();
                  _storyController.clear();

                  _imageBytes = null;
                  _selectedType = null;
                },
                label: Text('Save'),
                icon: Icon(FontAwesomeIcons.floppyDisk),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
