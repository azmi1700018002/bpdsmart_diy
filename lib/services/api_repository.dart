import 'dart:async';

import 'package:bpdsmart_diy/models/models.dart';
import 'package:bpdsmart_diy/models/response/login_response.dart';
import 'package:bpdsmart_diy/models/response/register_response.dart';
import 'package:bpdsmart_diy/models/response/users_response.dart';
import 'package:flutter/cupertino.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/login', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    } else {
      Text("Error");
    }
    return null;
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
    return null;
  }

  Future<UsersResponse?> getUsers() async {
    final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
    if (res.statusCode == 200) {
      return UsersResponse.fromJson(res.body);
    }
    return null;
  }
}
