import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/movie_cubit.dart';
import 'package:talenavi_movie/theme_manager/space_manager.dart';

import '../widget/movie_list.dart';
import '../widget/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    context.read<MovieCubit>().fetchMovie();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Collection'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).goNamed('form'),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            16.0.spaceY,
            SearchTextField(controller: _searchController),
            16.0.spaceY,
            const Expanded(
              child: MovieList(),
            )
          ],
        ),
      ),
    );
  }
}
