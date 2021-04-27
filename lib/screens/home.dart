import 'package:flutter/material.dart';
import 'package:nid_notes/models/user.dart';
import 'package:nid_notes/blocs/user_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Text('Home'),
          ),
        ),
      ),
    );
  }
}