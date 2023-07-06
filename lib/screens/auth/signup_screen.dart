import 'package:flutter/material.dart';
import 'package:sunspark/screens/auth/login_screen.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/widgets/button_widget.dart';
import 'package:sunspark/widgets/text_widget.dart';
import 'package:sunspark/widgets/textfield_widget.dart';

class SignupScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();

  SignupScreen({super.key});

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
                height: 25,
              ),
              TextFieldWidget(label: 'Email', controller: emailController),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  label: 'Password', controller: passwordController),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  inputType: TextInputType.number,
                  label: 'Age',
                  controller: ageController),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(label: 'Gender', controller: genderController),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(label: 'Address', controller: addressController),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                label: 'Register',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextRegular(
                    text: 'Already have an account?',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: TextBold(
                      text: 'Login here',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
