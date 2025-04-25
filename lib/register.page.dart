// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtName = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register(BuildContext context) async {

    try {

      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text);

      await credential.user!.updateDisplayName(txtName.text);

      Navigator.of(context)..pop()..pushReplacementNamed("/chat");
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
          // spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtName,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  border: OutlineInputBorder(),
                  hintText: "Nome",
                ),
              ),
              SizedBox(height: 10),
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
              child: Text("Register"),
              onPressed: () => _register(context),
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