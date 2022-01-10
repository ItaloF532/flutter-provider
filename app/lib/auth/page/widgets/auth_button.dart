import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/auth/controller/auth_controller.dart';

class AuthBUtton extends StatelessWidget {
  const AuthBUtton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = context.watch<AuthController>();

    return ElevatedButton(
      onPressed: authController.state == AuthState.loading
          ? null
          : () {
              authController.loginAction();
            },
      child: const Text('Login'),
    );
  }
}
