import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_tuto/domain/user.dart';

final loginServiceProvider = Provider<LoginRiverpodService>((ref) => LoginRiverpodService());

class LoginRiverpodService {
  User user = User(isLoading: true);

  Future<User> loginRiverpod({required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 5), () {
      user = User(isLoading: false, name: "Wilfried", age: 30, sexe: "M", id: 1);
    });
    return user;
  }
}