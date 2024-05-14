import '../../database/database_helper.dart';
import '../models/user.dart';

class AuthenticationService {
  final DatabaseHelper _databaseHelper;

  AuthenticationService(this._databaseHelper);

  Future<bool> authenticate(String email, String password) async {
    User? user = await _databaseHelper.getUserByEmail(email);
    if (user != null && user.password == password) {
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    final User newUser = User(email: email, password: password);  // Consider hashing the password here
    final int result = await _databaseHelper.addUser(newUser);
    return result > 0;
  }
}

