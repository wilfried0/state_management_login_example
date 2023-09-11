class LoginValueNotifierService {
  bool isLoggIn = false;

  Future<bool> loginValueNotifier({required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 5), () {
      isLoggIn = true;
    });
    return isLoggIn;
  }
}