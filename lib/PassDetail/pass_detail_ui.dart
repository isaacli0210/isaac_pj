import 'package:flutter/material.dart';

class PassDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(228, 51, 66, 1),
        title: Text('Data'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Text('Event'),
      ),
    );
  }
}