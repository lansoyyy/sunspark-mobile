import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/widgets/button_widget.dart';
import 'package:sunspark/widgets/text_widget.dart';
import 'package:sunspark/widgets/textfield_widget.dart';
import 'package:intl/intl.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  final nameController = TextEditingController();

  final numberController = TextEditingController();

  final addressController = TextEditingController();

  final statementController = TextEditingController();

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

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  String selected = 'Theft';
  var selectedDateTime = DateTime.now();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final formattedDateTime =
        DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime);
    return Scaffold(
        appBar: AppBar(
          title: TextRegular(
              text: 'Adding Report', fontSize: 18, color: Colors.white),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
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
                    width: 350, label: 'Name', controller: nameController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    width: 350,
                    label: 'Phone Number',
                    controller: numberController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
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
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selected,
                    items: type1.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: SizedBox(
                            width: 300,
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
                        selected = newValue.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _selectDateTime(context);
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: TextEditingController(
                        text: formattedDateTime,
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
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(10.2477, 122.9888),
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
                  color: Colors.black,
                  height: 100,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.file_upload,
                        color: Colors.black,
                      ),
                      label: TextRegular(
                          text: 'Browse Gallery',
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.black,
                      ),
                      label: TextRegular(
                          text: 'Camera', fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: check1,
                      onChanged: (value) {
                        setState(() {
                          check1 = !check1;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'I certify that the information I provided in this form is accurate and true.',
                        style: TextStyle(fontFamily: 'QRegular'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: check2,
                      onChanged: (value) {
                        setState(() {
                          check2 = !check2;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'I understand that any false statements I provided can be used against me.',
                        style: TextStyle(fontFamily: 'QRegular'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: check3,
                      onChanged: (value) {
                        setState(() {
                          check3 = !check3;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'I understand that this document will be considered strictly condifential.',
                        style: TextStyle(fontFamily: 'QRegular'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                check1 == false || check2 == false || check3 == false
                    ? const SizedBox()
                    : Center(
                        child: ButtonWidget(
                            label: 'Add Report',
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: TextBold(
                                        text: 'Alert',
                                        fontSize: 18,
                                        color: Colors.black),
                                    content: TextRegular(
                                        text:
                                            'Your report was succesfully submitted!',
                                        fontSize: 14,
                                        color: Colors.grey),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen()));
                                        },
                                        child: TextRegular(
                                            text: 'Close',
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                    ],
                                  );
                                },
                              );
                            })),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );

    setState(() {
      selectedDateTime = DateTime(
        pickedDateTime!.year,
        pickedDateTime.month,
        pickedDateTime.day,
        pickedTime!.hour,
        pickedTime.minute,
      );
    });
  }
}
