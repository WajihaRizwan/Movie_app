import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movieapp/login.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after a 3-second delay
    Timer(const Duration(seconds: 3), _navigateToLogin);
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>   const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.red,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asessts/transparent-play-button-white-button-with-red-circle-arrow-1710834649212.webp', // Path to your logo
                  height: 150,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    
  }
}