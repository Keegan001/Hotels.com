import 'package:app1/pages/landingpage.dart';
import 'package:app1/pages/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'homepage.dart';
import 'package:flutter/material.dart';

class RegScreen extends StatefulWidget {
  RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
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
          'Register',
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
            child: Center(
              child: Icon(
                Icons.app_registration,
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

                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: mail, password: pass);
                final user = FirebaseAuth.instance.currentUser;
                if (user != Null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navbar()));
                }
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            child: Text('Already Have An Account?'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
