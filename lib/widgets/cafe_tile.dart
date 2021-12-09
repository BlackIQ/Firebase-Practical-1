import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  CafeTile({this.cafe});

  final cafe;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.brown[cafe.strength],
        ),
        title: Text(cafe.name),
        subtitle: Text(cafe.sugar.toString()),
      ),
    );
  }
}
