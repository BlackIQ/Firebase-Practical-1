import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnfirebase/models/cafe.dart';
import 'package:learnfirebase/models/user.dart';

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

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugar'],
      strength: snapshot.data['strength'],
    );
  }

  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_cafeListFromSnapshot);
  }

  Stream<UserData> get userData {
    return cafeCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}