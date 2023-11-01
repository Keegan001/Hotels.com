import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = FirebaseAuth.instance.currentUser!.email.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: 400,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 100,
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(
            
            height: 200,
            child: Card(
                child: Column(
              children: [
                Text(email),
              ],
            ),),
          )
        ],
      ),
    );
  }
}
