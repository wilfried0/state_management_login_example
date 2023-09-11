import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_tuto/shared/widgets.dart';
import '../services/login_riverpod_service.dart';

final loginNotifierProvider = StateNotifierProvider<LoginRiverpodNotifier, bool>(
        (ref) => LoginRiverpodNotifier(ref.watch(loginServiceProvider))
);

class LoginRiverpodNotifier extends StateNotifier<bool>{
  final LoginRiverpodService _loginService;
  LoginRiverpodNotifier(this._loginService) : super(false);

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
      try {
        state = true;
        await _loginService.loginRiverpod(username: username, password: password).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context: context, content: 'Logged successfully!', label: 'Success', color: Colors.green));
        });
        state = false;
      }catch(e){
        state = false;
      }
    }
  }
}