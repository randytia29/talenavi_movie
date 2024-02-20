import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talenavi_movie/common_enum/enum_genre.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/add_movie_cubit.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/movie_cubit.dart';
import 'package:talenavi_movie/features/movie/presentation/widget/custom_text_field.dart';
import 'package:talenavi_movie/sl.dart';
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

  late AddMovieCubit _addMovieCubit;

  List<String> selectedGenres = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _directorController = TextEditingController();
    _summaryController = TextEditingController();

    _addMovieCubit = sl<AddMovieCubit>();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _directorController.dispose();
    _summaryController.dispose();

    _addMovieCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _addMovieCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<AddMovieCubit, AddMovieState>(
            listener: (context, state) {
              if (state is AddMovieFailed) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }

              if (state is AddMovieSuccess) {
                context.read<MovieCubit>().fetchMovie();
              }
            },
          ),
          BlocListener<MovieCubit, MovieState>(
            listener: (context, state) {
              if (state is MovieLoaded) {
                GoRouter.of(context).pop();
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            actions: [
              widget.movie == null
                  ? Container()
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
              IconButton(
                onPressed: () {
                  if (widget.movie == null) {
                    if (_titleController.text.isNotEmpty &&
                        _directorController.text.isNotEmpty &&
                        _summaryController.text.isNotEmpty &&
                        selectedGenres.isNotEmpty) {
                      _addMovieCubit.startSaveMovie(
                        MovieModel(
                          id: Random().nextInt(100),
                          title: _titleController.text,
                          director: _directorController.text,
                          summary: _summaryController.text,
                          genres: convertGenreString(selectedGenres),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Lengkapi isian')));
                    }
                  } else {}
                },
                icon: const Icon(Icons.save),
              )
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
        ),
      ),
    );
  }

  String convertGenreString(List<String> genres) => genres.join(',');

  Color convertColor(List<String> selectedGenres, GenreType genre) {
    if (selectedGenres.contains(genre.value)) {
      return Colors.red;
    }

    return Colors.black;
  }
}