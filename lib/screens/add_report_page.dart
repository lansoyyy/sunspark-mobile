import 'package:flutter/material.dart';
import 'package:sunspark/widgets/text_widget.dart';

class AddReportPage extends StatelessWidget {
  const AddReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextRegular(
            text: 'Adding Report', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
    );
  }
}
