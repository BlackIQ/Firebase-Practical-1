import 'package:flutter/material.dart';
import 'package:learnfirebase/screens/authenticate/login.dart';
import 'package:learnfirebase/screens/authenticate/register.dart';
import 'package:learnfirebase/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                '☕',
                style: TextStyle(
                  fontSize: 100,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Login in to your account',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('Error.');
                  }
                  else {
                    print('Signed in.');
                    print(result.uid);
                  }
                },
                child: Text('Sign in Anonymously'),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text('Sign in with Email'),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: Text('Sign up with Email'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
