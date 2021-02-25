import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/main_nav_page.dart';
import 'package:flutter_app/screens/nav_pages/nav_bar.dart';
import 'package:flutter_app/screens/sign_pages/sign_check.dart';
import 'package:hive/hive.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loginCheck() async {
    await Hive.openBox('SignBox');
    var box = Hive.box('SignBox');
    var status = box.get('status');
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (status == 0 || status == null) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => SignCheck()));
      } else if (status == 1) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => NavBar()));
      }
      timer.cancel();
    });
  }

  @override
  void initState() {
    loginCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        child: Text(
          'by Tekan',
          textAlign: TextAlign.center,
        ),
        width: MediaQuery.of(context).size.width,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 150,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Flutter Tübit Dersi')
            ],
          ),
        ),
      ),
    );
  }
}
