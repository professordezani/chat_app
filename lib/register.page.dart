// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          // spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  border: OutlineInputBorder(),
                  hintText: "Nome",
                ),
              ),
              SizedBox(height: 10),
            TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: "E-mail",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  hintText: "Senha",
                ),
              ),
              SizedBox(height: 10),
            ElevatedButton(
              child: Text("Register"),
              onPressed: () => Navigator.of(context)..pop()..pushReplacementNamed("/chat"),
            ),
            TextButton(
              child: Text("Back to login"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}