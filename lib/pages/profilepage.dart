import 'package:app1/pages/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String email = FirebaseAuth.instance.currentUser!.email.toString();

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 100,
                  child: SvgPicture.asset(
                    'assets/person.svg',
                    height: 180,
                    width: 180,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Card(
              child: Text(
                '\n Your e-mail is $email',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            child: Card(
              child: ElevatedButton(
                onPressed: _signOut,
                child: const Text('Sign Out'),
              ),
            ),
          )
        ],
      ),
    );
  }
}