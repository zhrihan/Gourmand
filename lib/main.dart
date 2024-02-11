import 'dart:async';
import 'package:flutter/material.dart';
import 'signIn.dart'; // Import the sign-in page

void main() =>
 runApp(MyApp());

 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      // Define the routes for the application
      routes: {
        '/signin': (context) => SignInPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), _navigateToSignIn);
  }

  void _navigateToSignIn() {
    if (mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF12372a),
      body: Center(
        child: Image.asset('assets/mainIcon.png'),
      ),
    );
  }
}
