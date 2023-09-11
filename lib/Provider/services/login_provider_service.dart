import 'package:provider/provider.dart';

final loginServiceProvider = Provider(create: (_) => LoginProviderService());

class LoginProviderService {
  bool isLoggIn = false;

  Future<bool> loginProvider({required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 5), () {
      isLoggIn = true;
    });
    return isLoggIn;
  }
}