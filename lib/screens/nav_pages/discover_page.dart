import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Keşfet'),
      ),
      body: Center(
        child: Container(
          child: Text('Keşfet'),
        ),
      ),
    );
  }

}