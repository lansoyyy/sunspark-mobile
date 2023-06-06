import 'package:flutter/material.dart';
import 'package:sunspark/widgets/text_widget.dart';

import '../../widgets/drawer_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: TextRegular(
          text: 'PROFILE',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/profile.png',
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Full Name', fontSize: 18, color: Colors.black),
            const SizedBox(
              height: 5,
            ),
            TextRegular(text: 'Full Name', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Age', fontSize: 18, color: Colors.black),
            const SizedBox(
              height: 5,
            ),
            TextRegular(text: 'Age', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Gender', fontSize: 18, color: Colors.black),
            const SizedBox(
              height: 5,
            ),
            TextRegular(text: 'Gender', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Address', fontSize: 18, color: Colors.black),
            const SizedBox(
              height: 5,
            ),
            TextRegular(text: 'Address', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
