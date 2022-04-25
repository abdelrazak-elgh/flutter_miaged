// class AppUser extends Equatable {
//   String? uid;
//   AppUser({required this.uid});
//   AppUser.perDefault();

//   @override
//   List<Object?> get props => [uid];
// }

// class AppUserData {
//   final String uid;
//   final String name;
//   final int counter;

//   AppUserData({required this.uid, required this.name, required this.counter});
// }

import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photo;

  const AppUser({required this.id, this.email, this.name, this.photo});

  static const empty = AppUser(id: '');

  bool get isEmpty => this == AppUser.empty;
  bool get isNotEmpty => this != AppUser.empty;

  @override
  List<Object?> get props => [id, email, name, photo];
}
