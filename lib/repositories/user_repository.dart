import 'package:help/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../models/user.dart';

class UserRepository {

  Future<void> signUp(User user) async{
    final parseUser = ParseUser(
      user.email, user.password, user.email
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);  //userType enum o parse nao reconhece, assim transformamos para o index (ALUNO = 0, SERVIDOR = 1)

    await parseUser.signUp();

  }
}