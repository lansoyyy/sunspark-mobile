import 'package:flutter/material.dart';
import 'package:sunspark/widgets/text_widget.dart';
import 'package:sunspark/widgets/textfield_widget.dart';

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

  String selected = 'Theft';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextRegular(
              text: 'Adding Report', fontSize: 18, color: Colors.white),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
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
                  width: 350, label: 'Address', controller: addressController),
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
                    text: 'Incident Type:', fontSize: 14, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
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
              ),
            ],
          ),
        ));
  }
}
