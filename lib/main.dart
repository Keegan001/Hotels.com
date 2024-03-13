import 'package:app1/pages/navbar.dart';
import 'package:app1/pages/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const AuthenticationWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({super.key});

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  void checkUserAuthentication() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // User is not authenticated, show the splash screen and then navigate to the registration screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnimatedSplashScreen.withScreenFunction(
              screenFunction: () async {
                return RegScreen();
              },
              duration: 3000,
              splash: Icons.area_chart_outlined,
              splashTransition: SplashTransition.slideTransition,
              backgroundColor: Colors.purpleAccent,
            ),
          ),
        );
      } else {
        // User is authenticated, navigate to the landing page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Navbar(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
