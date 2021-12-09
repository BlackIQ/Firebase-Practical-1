import 'package:flutter/material.dart';
import 'package:learnfirebase/models/user.dart';
import 'package:learnfirebase/screens/wrapper.dart';
import 'package:learnfirebase/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Wrapper(),
      ),
    );
  }
}