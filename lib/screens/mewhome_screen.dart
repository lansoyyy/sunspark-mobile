import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sunspark/screens/pages/notif_page.dart';
import 'package:sunspark/widgets/drawer_widget.dart';

import '../widgets/text_widget.dart';
import 'home_screen.dart';

class NewHomeScreen extends StatefulWidget {
  final bool? inUser;

  const NewHomeScreen({
    super.key,
    this.inUser = true,
  });

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  List<String> type1 = [
    'Theft',
    'Assault',
    'Burglary',
    'Fraud',
    'Kidnapping',
    'Rape',
    'Robbery',
    'Murder',
    'Road Accident',
    'Others'
  ];

  String filter = 'Types';

  List<String> filters = [
    'Types',
    'Status',
  ];

  String status = 'New';

  List<String> statuses = [
    'New',
    'Resolved',
    'Unresolved',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(
        inUser: widget.inUser,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: TextRegular(
          text: 'HOME',
          fontSize: 18,
          color: Colors.white,
        ),
        actions: [
          !widget.inUser!
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotifScreen()));
                  },
                  icon: Badge(
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    label: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Reports')
                            .where('status', isEqualTo: 'Processing')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            print('waiting');
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return TextRegular(
                              text: data.docs.length.toString(),
                              fontSize: 14,
                              color: Colors.white);
                        }),
                    child: const Icon(
                      Icons.notifications,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextRegular(
              text: 'Filter by:',
              fontSize: 18,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownButton<String>(
                underline: const SizedBox(),
                value: filter,
                items: filters.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Center(
                      child: SizedBox(
                        width: 325,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'QRegular',
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    filter = newValue.toString();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            filter == 'Types'
                ? Expanded(
                    child: GridView.builder(
                      itemCount: type1.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Reports')
                                .where('type', isEqualTo: type1[index])
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return const Center(child: Text('Error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                print('waiting');
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                );
                              }

                              final newData = snapshot.requireData;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            filter: type1[index],
                                            inUser: widget.inUser,
                                            inTypes: true,
                                          )));
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextBold(
                                        text: newData.docs.length.toString(),
                                        fontSize: 48,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextRegular(
                                        text: type1[index],
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      itemCount: statuses.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Reports')
                                .where('status', isEqualTo: statuses[index])
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return const Center(child: Text('Error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                print('waiting');
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                );
                              }

                              final newData = snapshot.requireData;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            filter: statuses[index],
                                            inUser: widget.inUser,
                                            inTypes: false,
                                          )));
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextBold(
                                        text: newData.docs.length.toString(),
                                        fontSize: 32,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextRegular(
                                        text: statuses[index],
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
