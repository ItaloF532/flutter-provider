import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/auth/controller/auth_controller.dart';
import 'package:provider_start/auth/page/auth_page.dart';
import 'package:provider_start/auth/providers/auth_provider.dart';
import 'package:provider_start/home/home_page.dart';

import 'package:provider_start/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
            create: (context) => AuthController(
                  context.read<AuthProvider>(),
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/auth': (_) => const AuthPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
