import 'package:flutter/material.dart';
import 'package:movieapp/home_screen.dart';
import 'package:movieapp/splashscreen.dart';
import 'package:movieapp/widgets/movie_detail.dart';
import 'package:movieapp/widgets/my_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splashscreen(),
    );
  }
}