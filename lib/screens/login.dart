import 'package:flutter/material.dart';
import 'package:nid_notes/models/user.dart';
import 'package:nid_notes/blocs/user_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginFormKey = GlobalKey<FormState>();

  User _user = User();
  // @override
  // void initState() {
  //   super.initState();
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username'
                    ),
                    onSaved: (value) {
                      _user.username = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserisci lo username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _user.password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserisci la password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        _loginFormKey.currentState!.save();
                        userBloc.login(_user).then((success) {
                          if (success) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Credenziali errate')));
                          }
                        });
                      }
                    },
                    child: Text('Accedi'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}