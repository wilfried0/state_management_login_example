import 'package:flutter/material.dart';
import '../../shared/widgets.dart';

class LoginProviderNotifier extends ChangeNotifier {
  bool _isLoggIn = false;
  bool get isLoggIn => _isLoggIn;

  login({required String username, required String password, required BuildContext context}) async {
    if(password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Password is required', label: 'Error'));
      return;
    }
    if(password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Password length must be greater than 8', label: 'Error'));
      return;
    }
    if(username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Username is required', label: 'Error'));
      return;
    }
    if(password != 'password'){
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Username or password doesn\'t match', label: 'Error'));
    }else{
      _isLoggIn = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 5), () {
        ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Logged successfully!', label: 'Success', color: Colors.green));
      });
      _isLoggIn = false;
      notifyListeners();
    }
  }
}