import 'package:flutter/material.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: LoginPage(),
    );
  }
}