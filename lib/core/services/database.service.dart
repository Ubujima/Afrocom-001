import 'package:afrocom/app/constants/database.credentials.dart';
import 'package:afrocom/core/api/appwrite.api.dart';
import 'package:afrocom/core/models/signeduser.model.dart';

class DatabaseService {
  Future addUserToDB({required SignedUser user}) async {
    try {
      AppwriteAPI.createInstance.addData(
          data: SignedUser(
              user.username, user.useremail, user.userfullname, user.userdob),
          collectionId: DatabaseCredentials.UserDatabaseID);
    } catch (error) {
      print(error);
    }
  }
}
