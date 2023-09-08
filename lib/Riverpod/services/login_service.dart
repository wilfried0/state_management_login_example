import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginServiceProvider = Provider<LoginService>((ref) => LoginService());

class LoginService {
  bool isLoggIn = false;

  Future<bool> login({required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 5), () {
      isLoggIn = true;
    });
    return isLoggIn;
  }
}