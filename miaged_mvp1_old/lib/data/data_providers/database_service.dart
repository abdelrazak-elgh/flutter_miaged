import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged_mvp1/data/models/user_model.dart';

class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addUserData(UserModel userData) async {
    await firestore.collection("Users").doc().set(userData.toMap());
  }

  // to retrive all the document inside the users collection thanks to Query snapshot
  Future<List<UserModel>> retrieveUserData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("Users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  // to retrieve the displayName of the user.
  Future<String> retrieveUserName(UserModel user) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("Users").doc(user.uid).get();
    return snapshot.data()!["displayName"];
  }
}
