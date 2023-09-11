import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tuto/Provider/notifiers/login_provider_notifier.dart';
import 'package:state_management_tuto/Provider/notifiers/password_visibility_provider_notifier.dart';
import 'package:state_management_tuto/shared/functions.dart';
import '../shared/widgets.dart';
import '../shared/custom_button.dart';

class LoginProvider extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController(), passwordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hidden = Provider.of<PasswordVisibilityProviderNotifier>(context);
    final login = Provider.of<LoginProviderNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: customAppBar(title: 'Login with Provider'),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.grey, size: 25,),
                  hintText: 'Username',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)
              ),
            ),

            const SizedBox(height: 20,),

            TextField(
              controller: passwordController,
              obscureText: hidden.isHidden,
              style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 25,),
                  suffixIcon: IconButton(
                    onPressed: () {
                      hidden.passwordVisibility();
                    },
                    icon: Icon(hidden.isHidden?Icons.visibility_off:Icons.visibility, color: Colors.grey, size: 25,),
                  ),
                  hintText: 'Password',
                  border: InputBorder.none,
                  hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)
              ),
            ),

            const SizedBox(height: 20,),

            login.isLoggIn? const CircularProgressIndicator():
            CustomButton(
                onPressed: () {
                  login.login(
                      username: usernameController.text,
                      password: passwordController.text,
                      context: context
                  );
                },
                title: 'Connexion',
                textStyle: customTextStyleButton(),
                color: Colors.purpleAccent
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: launchURL,
        child: Icon(Icons.code, color: Colors.white,),
      ),
    );
  }
}