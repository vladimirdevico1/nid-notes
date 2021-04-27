import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new Timer(new Duration(milliseconds: 3000), () {
      // if (userBloc.currentUser != null) {
      //   Navigator.of(context).pushReplacementNamed('/main');
      // } else {
      //   Navigator.of(context).pushReplacementNamed('/start');
      // }
      Navigator.of(context).pushReplacementNamed('/login');
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Caricamento..."),
        ),
      ),
    );
  }
}