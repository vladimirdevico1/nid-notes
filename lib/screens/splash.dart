import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nid_notes/blocs/user_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    userBloc.init().then((_) {
      new Timer(new Duration(milliseconds: 3000), () {
        if (userBloc.currentUser != null) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      });
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