import 'package:flutter/material.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/widgets/button_widget.dart';
import 'package:sunspark/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/police.jpg',
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFieldWidget(label: 'Email', controller: emailController),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(label: 'Password', controller: passwordController),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              label: 'Login',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
