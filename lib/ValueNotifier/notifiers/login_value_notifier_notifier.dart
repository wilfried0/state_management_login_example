import 'package:flutter/material.dart';
import 'package:state_management_tuto/ValueNotifier/services/login_value_notifier_service.dart';
import '../../shared/widgets.dart';

class LoginValueNotifierNotifier extends ValueNotifier<bool> {
  final LoginValueNotifierService _loginValueNotifierService;
  LoginValueNotifierNotifier(this._loginValueNotifierService) : super(false);

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
      value = true;
      notifyListeners();
      await _loginValueNotifierService.loginValueNotifier(username: username, password: password).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Logged successfully!', label: 'Success', color: Colors.green));
      });
      value = false;
      notifyListeners();
    }
  }
}