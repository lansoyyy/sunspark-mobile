import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sunspark/screens/auth/signup_screen.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/widgets/button_widget.dart';
import 'package:sunspark/widgets/text_widget.dart';
import 'package:sunspark/widgets/textfield_widget.dart';

import '../../widgets/toast_widget.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool? inUser;

  LoginScreen({super.key, this.inUser = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/citizen.jpg',
                height: 150,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldWidget(
                  label: inUser! ? 'Email' : 'Username',
                  controller: emailController),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  label: 'Password', controller: passwordController),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                label: 'Login',
                onPressed: () {
                  login(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              inUser!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextRegular(
                          text: 'New to Carnab?',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                          },
                          child: TextBold(
                            text: 'Register here',
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: inUser!
              ? emailController.text
              : '${emailController.text}@carnab.com',
          password: passwordController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(
                inUser: inUser,
              )));
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
