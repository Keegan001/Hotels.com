import 'package:app1/pages/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _loginemailcontroller = TextEditingController();
  final _loginpassword = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void dispose() {
    _loginemailcontroller.dispose();
    _loginpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 150.0,
            width: 190.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: Center(child: SvgPicture.asset("assets/loginimage.svg")),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _loginemailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.purple,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                labelText: 'User Name',
                hintText: 'Enter Mail Id',
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _loginpassword,
              obscureText: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.purple,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                final mail = _loginemailcontroller.text;
                final pass = _loginpassword.text;
                User? user;
                try {
                  UserCredential userCredential = await _auth
                      .signInWithEmailAndPassword(email: mail, password: pass);
                  user = userCredential.user;
                  if (user != Null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navbar()));
                  }
                } on FirebaseAuthException catch (e) {
                  print(e);
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
