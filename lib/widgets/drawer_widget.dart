import 'package:flutter/material.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/screens/pages/profile_page.dart';
import 'package:sunspark/widgets/text_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  // final Stream<DocumentSnapshot> userData =
  //     FirebaseFirestore.instance.collection('Users').doc(userId).snapshots();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              accountEmail:
                  TextRegular(text: 'email', fontSize: 0, color: Colors.white),
              accountName: TextBold(
                text: 'Name',
                fontSize: 14,
                color: Colors.white,
              ),
              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  minRadius: 50,
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: TextBold(
                text: 'Home',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: TextBold(
                text: 'Profile',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.help),
            //   title: TextBold(
            //     text: 'Help',
            //     fontSize: 12,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.of(context).pushReplacement(MaterialPageRoute(
            //         builder: (context) => const HomeScreen()));
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: TextBold(
                text: 'Legal and Policies',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: TextBold(
                text: 'Logout',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Logout Confirmation',
                            style: TextStyle(
                                fontFamily: 'QBold',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Are you sure you want to Logout?',
                            style: TextStyle(fontFamily: 'QRegular'),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
