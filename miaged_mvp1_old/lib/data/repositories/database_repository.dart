import 'package:miaged_mvp1/data/data_providers/database_service.dart';
import 'package:miaged_mvp1/data/models/user_model.dart';

class DatabaseRepository {
  DatabaseService service = DatabaseService();

  Future<void> saveUserData(UserModel user) {
    return service.addUserData(user);
  }

  Future<List<UserModel>> retrieveUserData() {
    return service.retrieveUserData();
  }
}

