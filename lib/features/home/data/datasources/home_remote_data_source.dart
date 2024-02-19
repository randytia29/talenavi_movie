import 'dart:convert';

import '../../../../core/exception/exception.dart';
import '../../../../theme_manager/value_manager.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<UserModel>> getUser(int page);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUser(int page) async {
    final response = await client
        .get(Uri.parse('${ValueManager.baseUrl}/api/users?page=$page'));

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final users =
          List.from(data['data']).map((e) => UserModel.fromJson(e)).toList();

      return users;
    } else {
      throw ServerException();
    }
  }
}
