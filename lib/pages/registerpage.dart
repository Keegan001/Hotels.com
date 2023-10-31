import 'package:app1/pages/landingpage.dart';
import 'package:app1/pages/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegScreen extends StatefulWidget {
  RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _emailcontroller = TextEditingController();
  final _password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _emailcontroller.dispose();
    _password.dispose();
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
            child: SizedBox(
              height: 400,
              width: 300,
              child: SvgPicture.asset(
                "assets/registerimage.svg",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.purple,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                labelText: 'User Name',
                hintText: 'Enter Mail Id',
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.purple,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                final mail = _emailcontroller.text;
                final pass = _password.text;
                try {
                  final user = await _auth.createUserWithEmailAndPassword(
                      email: mail, password: pass);

                  if (user != Null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => navbar()));
                  }
                } catch (e) {
                  print(e);
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
