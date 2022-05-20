import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? uid;
  final String? email;
  final String? password;
  final String? name;
  final DateTime? birthday;
  //final String? photo;

  const UserModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.birthday,
  });

  static const empty = UserModel(uid: '');

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'email': email,
      'displayName': name,
      'birthday': birthday,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        password = doc.data()!["password"],
        name = doc.data()!["displayName"],
        birthday = doc.data()!["birthday"];

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [uid, email, password];
}
