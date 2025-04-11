// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // spacing: 10,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                hintText: "E-mail",
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: "Senha",
              ),
            ),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () => Navigator.pushReplacementNamed(context, "/chat"),
            ),
            TextButton(
              child: Text("Registre-se"),
              onPressed: () => Navigator.pushNamed(context, "/register"),
            )
          ],
        ),
      ),
    );
  }
}