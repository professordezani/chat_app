// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login(BuildContext context) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text);

      Navigator.pushReplacementNamed(context, "/chat");
    }
    on FirebaseAuthException catch(ex) {
      final snackBar = SnackBar(content: Text(ex.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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
              controller: txtEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                hintText: "E-mail",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: "Senha",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () => _login(context),
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