import 'package:flutter/material.dart';
import 'package:chat_app/chat.app.dart';
import 'package:firebase_core/firebase_core.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyCOzKJRqepif7l_sUQWfZ31bLUmh1cuuSg",
  authDomain: "chat-pdm-2025-01.firebaseapp.com",
  projectId: "chat-pdm-2025-01",
  storageBucket: "chat-pdm-2025-01.firebasestorage.app",
  messagingSenderId: "575004777555",
  appId: "1:575004777555:web:72f632b42fef6f3ebdfaa6"
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(const ChatApp());
}