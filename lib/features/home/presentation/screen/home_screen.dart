import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/theme_manager/space_manager.dart';

import '../cubit/user_cubit.dart';
import '../widget/user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().fetchUser(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          if (userState is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userState is UserFailed) {
            return Center(child: Text(userState.message));
          }

          if (userState is UserLoaded) {
            final users = userState.users;

            return ListView.separated(
              itemBuilder: (context, index) {
                final user = users[index];

                return UserCard(user: user);
              },
              separatorBuilder: (context, index) => 8.0.spaceY,
              itemCount: users.length,
            );
          }

          return Container();
        },
      ),
    );
  }
}
