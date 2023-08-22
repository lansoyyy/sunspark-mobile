import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunspark/screens/add_report_page.dart';
import 'package:sunspark/screens/pages/details_page.dart';
import 'package:sunspark/widgets/drawer_widget.dart';
import 'package:sunspark/widgets/text_widget.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:sunspark/widgets/user_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  final bool? inUser;

  const HomeScreen({super.key, this.inUser = true});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nameSearched = '';
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.inUser!
          ? FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddReportPage()));
              })
          : const SizedBox(),
      drawer: widget.inUser!
          ? const UserDrawerWidget()
          : DrawerWidget(
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
          Badge(
            backgroundColor: Colors.red,
            textColor: Colors.white,
            label: TextRegular(text: '1', fontSize: 14, color: Colors.white),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 50,
                width: 375,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      nameSearched = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  controller: searchController,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextBold(
              text: 'REPORTS',
              fontSize: 18,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Reports')
                    .where('type',
                        isGreaterThanOrEqualTo:
                            toBeginningOfSentenceCase(nameSearched))
                    .where('type',
                        isLessThan:
                            '${toBeginningOfSentenceCase(nameSearched)}z')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                  return Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                if (widget.inUser! == false) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            reportId: data.docs[index].id,
                                          )));
                                }
                              },
                              child: Card(
                                elevation: 3,
                                child: ListTile(
                                  title: TextBold(
                                      text: data.docs[index]['type'],
                                      fontSize: 18,
                                      color: Colors.black),
                                  subtitle: TextRegular(
                                      text: data.docs[index]['statement'],
                                      fontSize: 12,
                                      color: Colors.grey),
                                  trailing: TextRegular(
                                      text: DateFormat.yMMMd().add_jm().format(
                                          data.docs[index]['dateAndTime']
                                              .toDate()),
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
