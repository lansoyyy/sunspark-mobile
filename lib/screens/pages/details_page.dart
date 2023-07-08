import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunspark/widgets/text_widget.dart';
import 'package:sunspark/widgets/textfield_widget.dart';

class DetailsPage extends StatefulWidget {
  final String reportId;
  const DetailsPage({super.key, required this.reportId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final nameController = TextEditingController();

  final numberController = TextEditingController();

  final addressController = TextEditingController();

  final statementController = TextEditingController();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Reports')
        .doc(widget.reportId)
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          title: TextRegular(
              text: 'Report Details', fontSize: 18, color: Colors.white),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: StreamBuilder<DocumentSnapshot>(
                stream: userData,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Loading'));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  dynamic data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBold(
                        text: 'Witness Information',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          enabled: false,
                          hint: data['name'],
                          width: 350,
                          label: 'Name',
                          controller: nameController),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          enabled: false,
                          hint: data['contactNumber'],
                          width: 350,
                          label: 'Phone Number',
                          controller: numberController),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          enabled: false,
                          hint: data['address'],
                          width: 350,
                          label: 'Address',
                          controller: addressController),
                      const SizedBox(
                        height: 20,
                      ),
                      TextBold(
                        text: 'Incident Information',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: TextRegular(
                            text: 'Incident Type:',
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                data['type'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'QRegular',
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: IgnorePointer(
                          child: TextFormField(
                            enabled: false,
                            controller: TextEditingController(
                              text: '',
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Date and Time',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.black,
                        height: 200,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(data['lat'], data['long']),
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          enabled: false,
                          hint: data['statement'],
                          width: 350,
                          height: 50,
                          label: 'Statement',
                          controller: statementController),
                      const SizedBox(
                        height: 20,
                      ),
                      TextBold(
                        text: 'Evidence (photo)',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data['evidencePhoto']),
                              fit: BoxFit.cover),
                        ),
                        height: 100,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
