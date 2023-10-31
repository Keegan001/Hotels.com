import 'package:app1/pages/navbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final emailcontroller = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 22,
            width: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150.0,
            width: 190.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Center(
              child: Icon(
                Icons.login,
                size: 60,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Mail Id',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () {
                final mail = emailcontroller.text;
                final pass = password.text;

                FirebaseAuth.instance
                    .signInWithEmailAndPassword(email: mail, password: pass);
                final user = FirebaseAuth.instance.currentUser;
                if (user != Null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navbar()));
                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
