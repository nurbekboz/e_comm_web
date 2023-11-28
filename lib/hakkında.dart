import 'package:flutter/material.dart';

class Hakkinda extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Hakkımızda ve İlkelerimiz",
        ),
        backgroundColor: Color(0xfff54a8c7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('')
            ],
          ),
        ),
      ),
    );
  }
}
