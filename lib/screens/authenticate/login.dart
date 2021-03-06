import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/screens/authenticate/register.dart';
import 'package:learnfirebase/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login to your account'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Login with Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'due@gmail.com',
              ),
              obscureText: false,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: '*******',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    dynamic result = await _auth.loginWithEmail(_email.text, _password.text);
                    if (result.runtimeType == List) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Something went wrong'),
                            content: SingleChildScrollView(
                              child: Text(
                                result[1],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.of(context).pop(context);
                    }
                  },
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text(
                    'Register a new account',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
