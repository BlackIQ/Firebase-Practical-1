import 'package:flutter/material.dart';
import 'package:learnfirebase/models/cafe.dart';
import 'package:learnfirebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:learnfirebase/services/database.dart';
import 'package:learnfirebase/widgets/cafe_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Cafe>>.value(
      value: DatabaseServer().cafes,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
          centerTitle: true,
          title: Text('Home'),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: CafeList(),
      ),
    );
  }
}
