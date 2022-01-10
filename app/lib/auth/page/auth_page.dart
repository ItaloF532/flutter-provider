import 'package:flutter/material.dart';
import 'package:provider_start/auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/auth/page/widgets/auth_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = context.read<AuthController>();

    authController.addListener(() {
      if (authController.state == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro na autenticação'),
          ),
        );
      } else if (authController.state == AuthState.success) {
        Navigator.of(context).pushNamed('../home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onChanged: (value) {
                authController.authRequest =
                    authController.authRequest.copyWith(email: value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (value) {
                authController.authRequest =
                    authController.authRequest.copyWith(password: value);
              },
            ),
            const SizedBox(height: 13),
            const AuthBUtton(),
          ],
        ),
      ),
    );
  }
}
