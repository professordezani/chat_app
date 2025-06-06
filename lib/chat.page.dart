// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  final txtMessage = TextEditingController();

  Future<void> sendMessage() async {
      var data = {
        'message': txtMessage.text,
        'user_name': _auth.currentUser!.displayName,
        'uid': _auth.currentUser!.uid,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _db.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login')
          )
        ]
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _db
                .collection('messages')
                .orderBy('timestamp', descending: true)
                .snapshots(),
              builder: (context, snapshot) {

                if(!snapshot.hasData)
                  return Text("Carregando...");
                
                return ListView(
                  reverse: true,
                  children: snapshot.data!.docs.map((doc) => 
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text(doc['user_name']),
                      subtitle: Text(doc['message']),
                      trailing: Text(doc['timestamp'].toDate().toString()),
                    )
                  ).toList(),
                );
              }
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            color: Colors.grey[400],
            child: Row(
              // spacing: 10,
              children: [
                Expanded(child: TextField(controller: txtMessage)),
                IconButton(icon: Icon(Icons.send), onPressed: sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}