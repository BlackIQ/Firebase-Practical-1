import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  CafeTile({this.cafe});
  final cafe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[cafe.strength],
          ),
          title: Text(cafe.name),
          subtitle: Text(cafe.sugar.toString()),
        ),
      ),
    );
  }
}
