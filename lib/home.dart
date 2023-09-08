import 'package:flutter/material.dart';
import 'package:state_management_tuto/Riverpod/login_riverpod.dart';
import 'package:state_management_tuto/shared/custom_button.dart';
import 'package:state_management_tuto/shared/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: customAppBar(title: 'Choose state management'),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 50, color: Colors.black),
            const Text("Login with", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),),
            const SizedBox(height: 40,),
            CustomButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginRiverpod())),
                title: 'Riverpod',
                textStyle: customTextStyleButton(),
                color: Colors.purpleAccent
            ),
            const SizedBox(height: 20,),
            CustomButton(
                onPressed: () => null,//Navigator.push(context, MaterialPageRoute(builder: (_) => LoginRiverpod())),
                title: 'Provider',
                textStyle: customTextStyleButton(),
                color: Colors.purpleAccent
            ),
            const SizedBox(height: 20,),
            CustomButton(
                onPressed: () => null,//Navigator.push(context, MaterialPageRoute(builder: (_) => LoginRiverpod())),
                title: 'ValueNotifier',
                textStyle: customTextStyleButton(),
                color: Colors.purpleAccent
            ),
            const SizedBox(height: 20,),
            CustomButton(
                onPressed: () => null,//Navigator.push(context, MaterialPageRoute(builder: (_) => LoginRiverpod())),
                title: 'Inherited',
                textStyle: customTextStyleButton(),
                color: Colors.purpleAccent
            ),
            const SizedBox(height: 20,),
            CustomButton(
                onPressed: () => null,//Navigator.push(context, MaterialPageRoute(builder: (_) => LoginRiverpod())),
                title: 'Stream',
                textStyle: customTextStyleButton(),
                color: Colors.purpleAccent
            ),
          ],
        ),
      ),
    );
  }
}
