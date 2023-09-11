import 'package:flutter/material.dart';
import 'package:state_management_tuto/shared/functions.dart';
import '../shared/widgets.dart';
import 'notifiers/login_riverpod_notifier.dart';
import 'notifiers/password_visibility_riverpod_notifier.dart';
import '../shared/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRiverpod extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController(), passwordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: customAppBar(title: 'Login with Riverpod'),
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

            Consumer(
              builder: (context, ref, _) {
                final hidden = ref.watch(passwordVisibilityNotifierProvider);
                return TextField(
                  controller: passwordController,
                  obscureText: hidden,
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
                          ref.read(passwordVisibilityNotifierProvider.notifier).passwordVisibility();
                        },
                        icon: Icon(hidden?Icons.visibility_off:Icons.visibility, color: Colors.grey, size: 25,),
                      ),
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)
                  ),
                );
              }
            ),

            const SizedBox(height: 20,),

            Consumer(
              builder: (context, ref, _) {
                bool isLoading = ref.watch(loginNotifierProvider);
                return isLoading? const CircularProgressIndicator():
                CustomButton(
                    onPressed: () {
                      ref.read(loginNotifierProvider.notifier).login(
                          username: usernameController.text,
                          password: passwordController.text,
                          context: context
                      );
                    },
                    title: 'Connexion',
                    textStyle: customTextStyleButton(),
                    color: Colors.purpleAccent
                );
              }
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
