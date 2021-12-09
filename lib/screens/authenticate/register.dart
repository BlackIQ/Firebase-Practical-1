import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/screens/authenticate/login.dart';
import 'package:learnfirebase/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register an account'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Register with Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Jon Due',
              ),
              obscureText: false,
            ),
            SizedBox(height: 10),
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
                    dynamic result = await  _auth.registerWithEmail(_name.text, _email.text, _password.text);
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
                  child: Text('Create'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    'Have an account? Login',
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
