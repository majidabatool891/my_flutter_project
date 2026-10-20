// import 'package:assignment/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/profile_screen.dart';
import 'pages/search_screen.dart';
import 'pages/setting_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',

      routes: {
        '/home': (context) => const MainHomePage(),
        '/search': (context) => const SearchScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingScreen(),
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const MainHomePage());
  }
}
