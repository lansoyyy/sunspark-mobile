import 'package:flutter/material.dart';
import 'package:sunspark/screens/auth/login_screen.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/widgets/text_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/carnab.png',
                height: 120,
              ),
              TextBold(
                text: 'CARNab',
                fontSize: 24,
                color: Colors.black,
              ),
              TextRegular(
                text: 'Crime and Accident Reporting App of Nabua',
                fontSize: 14,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                inUser: false,
                              )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/police.jpg',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextBold(
                          text: 'Police Officer',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                                inUser: true,
                              )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/citizen.jpg',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextBold(
                          text: 'Nabua Citizen',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ],
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
