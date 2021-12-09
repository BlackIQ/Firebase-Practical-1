class User {
  final String uid;

  User({this.uid});
}

class UserData {
  UserData({
    this.uid,
    this.name,
    this.sugars,
    this.strength,
  });

  final String uid;
  final String name;
  final String sugars;
  final int strength;
}
