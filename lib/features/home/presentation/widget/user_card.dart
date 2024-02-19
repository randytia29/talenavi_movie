import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(user.firstName ?? '-'),
          Text(user.lastName ?? '-'),
          Text(user.email ?? '-')
        ],
      ),
    );
  }
}
