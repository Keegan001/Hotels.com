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
          builder: (context) => MainScreen(),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Your Profile',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      body: ListView(
        children: [
          SizedBox(
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
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            child: Card(
              child: ElevatedButton(
                child: Text('Sign Out'),
                onPressed: _signOut,
              ),
            ),
          )
        ],
      ),
    );
  }
}
