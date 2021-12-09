import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnfirebase/models/cafe.dart';

class DatabaseServer {
  DatabaseServer({this.uid});
  final String uid;

  // Collection references
  final CollectionReference cafeCollection = Firestore.instance.collection('cafes');

  // Update Data
  Future updateUserData(String sugar, String name, int strength) async {
    return cafeCollection.document(uid).setData({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  List<Cafe> _cafeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Cafe(
        name: doc.data['name'] ?? '',
        sugar: doc.data['sugar'] ?? '0',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_cafeListFromSnapshot);
  }
}