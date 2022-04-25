class AppUser {
  String? uid;
  AppUser({required this.uid});
  AppUser.perDefault();
}

class AppUserData {
  final String uid;
  final String name;
  final int counter;

  AppUserData({required this.uid, required this.name, required this.counter});
}
