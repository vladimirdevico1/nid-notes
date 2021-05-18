import 'package:flutter/material.dart';
import 'package:nid_notes/helper/database.dart';
import 'package:nid_notes/screens/home.dart';
import 'package:nid_notes/screens/login.dart';
import 'package:nid_notes/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NIDNotes());
}

class NIDNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NID Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}