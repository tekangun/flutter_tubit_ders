import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Ana Sayfa'),
      ),
      body: Center(
        child: Container(
          child: Text('Ana Sayfa'),
        ),
      ),
    );
  }

}