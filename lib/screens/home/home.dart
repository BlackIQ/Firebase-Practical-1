import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/models/cafe.dart';
import 'package:learnfirebase/models/user.dart';
import 'package:learnfirebase/services/auth.dart';
import 'package:learnfirebase/shared/loading.dart';
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
    final user = Provider.of<User>(context);

    TextEditingController _name = TextEditingController();
    TextEditingController _sugar = TextEditingController();
    TextEditingController _strength = TextEditingController();

    void _showSettings() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return StreamBuilder<UserData>(
            stream: DatabaseServer(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;

                _name.text = userData.name;

                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.brown),
                      TextField(
                        controller: _name,
                        decoration: InputDecoration(
                          hintText: 'Jon Due',
                          labelText: 'Update your name',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _sugar,
                        decoration: InputDecoration(
                          hintText: '1 to 5',
                          labelText: 'Sugar',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _strength,
                        decoration: InputDecoration(
                          hintText: '100, 200, to 600',
                          labelText: 'Strength',
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            await DatabaseServer(uid: user.uid).updateUserData(
                              _sugar.text,
                              _name.text,
                              int.parse(_strength.text),
                            );
                          },
                          child: Text('Update'),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Loading();
              }
            },
          );
        },
      );
    }

    return StreamProvider<List<Cafe>>.value(
      value: DatabaseServer().cafes,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _showSettings(),
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
