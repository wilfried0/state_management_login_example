import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginServiceProvider = Provider<LoginRiverpodService>((ref) => LoginRiverpodService());

class LoginRiverpodService {
  bool isLoggIn = false;

  Future<bool> loginRiverpod({required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 5), () {
      isLoggIn = true;
    });
    return isLoggIn;
  }
}