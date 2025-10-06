import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../services/db_helper.dart';

final dbProvider = Provider<DBHelper>((ref) => DBHelper());

final authProvider = StateProvider<Map<String, dynamic>?>((ref) => null);

final authServiceProvider = Provider<AuthService>((ref) {
  final db = ref.read(dbProvider);
  return AuthService(db, ref);
});

class AuthService {
  final DBHelper db;
  final Ref ref;

  AuthService(this.db, this.ref);

  Future<bool> login(String email, String pass) async {
    var user = await db.getUser(email, pass);
    if (user != null) {
      ref.read(authProvider.notifier).state = user;
      return true;
    }
    return false;
  }

  Future<bool> signup(String name, String email, String pass) async {
    try {
      await db.insertUser({"name": name, "email": email, "password": pass});
      return true;
    } catch (_) {
      return false;
    }
  }

  void logout() {
    ref.read(authProvider.notifier).state = null;
  }
}
