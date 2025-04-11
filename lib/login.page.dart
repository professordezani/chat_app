import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text("Login"),
        onPressed: () => Navigator.pushReplacementNamed(context, "/chat"),
      ),
    );
  }
}