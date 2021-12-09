import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnfirebase/models/cafe.dart';
import 'package:learnfirebase/widgets/cafe_tile.dart';
import 'package:provider/provider.dart';

class CafeList extends StatefulWidget {
  @override
  _CafeListState createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  @override
  Widget build(BuildContext context) {
    final cafes = Provider.of<List<Cafe>>(context);

    return ListView.builder(
      itemCount: cafes.length,
      itemBuilder: (context, index) {
        return CafeTile(cafe: cafes[index]);
      },
    );
  }
}
