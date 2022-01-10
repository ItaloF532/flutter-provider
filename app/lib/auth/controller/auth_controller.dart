import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_start/auth/model/auth_model.dart';
import 'package:provider_start/auth/providers/auth_provider.dart';
import 'package:provider_start/shared/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  var authRequest = AuthRequestModel('', '');

  var state = AuthState.idle;

  final AuthProvider authProvider;

  AuthController(this.authProvider);

  Future<void> loginAction() async {
    state = AuthState.loading;
    notifyListeners();

    try {
      final response = await authProvider.post(
        'http://localhost:8083/auth',
        data: authRequest.toMap(),
      );
      final shared = await SharedPreferences.getInstance();
      globaUserModel = UserModel.fromMap(response);
      await shared.setString('UserModel', globaUserModel!.toJson());
      state = AuthState.success;
      notifyListeners();
    } catch (e) {
      state = AuthState.error;
      notifyListeners();
    } finally {
      state = AuthState.idle;
      notifyListeners();
    }
  }
}
