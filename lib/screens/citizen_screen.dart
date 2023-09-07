import 'package:flutter/material.dart';
import 'package:sunspark/screens/home_screen.dart';
import 'package:sunspark/widgets/button_widget.dart';

import '../widgets/text_widget.dart';

class CitizenScreen extends StatefulWidget {
  final bool? inUser;

  const CitizenScreen({super.key, this.inUser = true});

  @override
  State<CitizenScreen> createState() => _CitizenScreenState();
}

class _CitizenScreenState extends State<CitizenScreen> {
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextRegular(
          text: 'Legal and Policies',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextBold(
                  text: 'Legal and Policies',
                  fontSize: 24,
                  color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              TextRegular(
                  text:
                      'Velit veniam cillum deserunt ea non eu officia laborum velit ut labore reprehenderit ad. Dolor dolor non ad deserunt. Magna ex exercitation laboris esse proident minim irure. Est laboris cillum eiusmod cupidatat proident excepteur est velit sint eu. Sit mollit sunt incididunt laborum irure nulla ullamco mollit. Excepteur cillum sint cillum in consequat minim labore sit sit cillum.'
                      'Ex labore do dolor consequat aute tempor nisi ex dolor adipisicing est mollit. Excepteur consectetur officia do ea quis do proident nulla est ea commodo nostrud sunt. Consectetur mollit in tempor ut. Voluptate proident cillum elit eiusmod.'
                      'Mollit consectetur nulla velit exercitation nulla aliqua eiusmod officia consequat magna consectetur anim. Exercitation id officia ullamco commodo id sint ad. Aute aute sit quis ad adipisicing sunt nostrud occaecat voluptate cillum duis fugiat. Ut cillum minim deserunt id aliquip dolor elit enim deserunt mollit ad dolor. Proident labore est aliqua magna sit aliqua eiusmod nostrud in ea irure reprehenderit magna. Adipisicing cupidatat laboris amet velit.'
                      'Magna consequat excepteur reprehenderit ad consequat in proident consectetur dolor. Irure sunt duis aliqua mollit aliqua sit cillum ea deserunt. Do magna esse ad officia dolore officia deserunt laborum elit quis ad veniam veniam. Nulla qui proident incididunt ipsum proident est laboris laboris do mollit nostrud fugiat. Ullamco qui nulla deserunt sit nulla veniam. Ullamco duis enim do exercitation commodo mollit irure quis. Lorem id voluptate exercitation et quis.'
                      'Cupidatat occaecat pariatur tempor minim ut minim tempor ipsum ad id commodo ullamco. Ullamco nostrud in exercitation et. Adipisicing dolore nisi ea aliqua tempor aute aliquip amet duis eu.'
                      'Excepteur nisi laboris aliquip et et. Est excepteur elit elit laboris consectetur cupidatat laboris qui fugiat aliqua occaecat id officia. Amet irure et Lorem anim sit dolor eu. Mollit duis consectetur nisi consequat cillum fugiat sint qui. Est sunt sunt irure est laboris do anim duis.'
                      'Irure aliquip officia dolore est sunt cupidatat ut dolor. Irure proident sunt pariatur occaecat mollit duis laboris labore elit. Minim ut Lorem commodo laboris nostrud in adipisicing enim mollit in dolore.'
                      'Consectetur anim excepteur aliqua enim. Sunt nostrud culpa non veniam do amet do ea incididunt eiusmod magna ut nostrud eiusmod. Dolor eu id sint id. Adipisicing occaecat enim minim id. Esse sunt culpa enim pariatur est veniam minim tempor pariatur esse esse ut. Ad cillum esse sit proident sunt velit veniam nisi tempor magna velit laborum consequat sit.'
                      'Aliquip cupidatat nostrud incididunt commodo veniam nisi dolor esse labore. Nisi duis proident minim incididunt quis sit sit. Pariatur sint dolore aute amet quis magna deserunt officia sit culpa eu. Ipsum amet id incididunt qui anim laborum irure veniam excepteur deserunt ex laboris nulla ullamco. Id enim exercitation eu sint ex. Lorem veniam nostrud consectetur do eu Lorem voluptate officia pariatur anim irure nostrud sint labore. Quis minim enim nostrud voluptate fugiat.'
                      'Ad non quis laboris exercitation et elit minim ea qui. Veniam in ullamco deserunt nulla reprehenderit reprehenderit non eiusmod. Est aute deserunt minim amet. Amet id mollit laborum in minim sunt. Cupidatat do anim adipisicing qui officia veniam deserunt tempor. Aliquip est labore ex exercitation duis officia mollit elit.',
                  fontSize: 14,
                  color: Colors.grey),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      'I agree to the legal and policies',
                      style: TextStyle(fontFamily: 'QRegular'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              check1
                  ? Center(
                      child: ButtonWidget(
                          label: 'Continue',
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          inUser: widget.inUser,
                                        )));
                          }))
                  : const SizedBox(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
