import 'package:flutter/material.dart';
import 'package:talenavi_movie/common_enum/enum_genre.dart';
import 'package:talenavi_movie/features/movie/presentation/widget/custom_text_field.dart';
import 'package:talenavi_movie/theme_manager/space_manager.dart';

import '../../domain/entities/movie.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, this.movie});

  final Movie? movie;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController _titleController;
  late TextEditingController _directorController;
  late TextEditingController _summaryController;

  List<String> selectedGenres = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _directorController = TextEditingController();
    _summaryController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _directorController.dispose();
    _summaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          widget.movie == null
              ? Container()
              : IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            16.0.spaceY,
            CustomTextField(
              controller: _titleController,
              title: 'Title',
            ),
            16.0.spaceY,
            CustomTextField(
              controller: _directorController,
              title: 'Director',
            ),
            16.0.spaceY,
            TextFormField(
              controller: _summaryController,
              maxLines: 3,
              maxLength: 100,
              decoration: const InputDecoration(
                labelText: 'Summary',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBCBCBC)),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            16.0.spaceY,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: GenreType.values
                  .map(
                    (e) => InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        if (selectedGenres.contains(e.value)) {
                          setState(() => selectedGenres.remove(e.value));
                        } else {
                          setState(() => selectedGenres.add(e.value));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: convertColor(selectedGenres, e),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(e.value),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Color convertColor(List<String> selectedGenres, GenreType genre) {
    if (selectedGenres.contains(genre.value)) {
      return Colors.red;
    }

    return Colors.black;
  }
}
