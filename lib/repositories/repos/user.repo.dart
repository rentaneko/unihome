import 'package:unihome/repositories/apis/user.api.dart';

class UserRepo {
  UserApi userApi;
  UserRepo(this.userApi);

  Future<String?> loginWithRenter(String username, String password) async {
    var res = await userApi.loginWithRenter(username, password);
    return res!.message;
  }
}
