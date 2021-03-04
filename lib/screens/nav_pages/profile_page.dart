import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main_nav_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var email = "";

  void loadDefaults() async{
    await Hive.openBox('SignBox');
    var box = Hive.box('SignBox');
    if(mounted){
      setState(() {
        email = box.get('email');
      });
    }
  }

  @override
  void initState() {
    loadDefaults();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await Hive.deleteFromDisk();
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(msg: 'Çıkış Yapıldı!');
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => NavPage()), (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: InkWell(onTap: () => logOut(), child: Icon(Icons.logout)),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text('Profil'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Eposta: $email'),
              SizedBox(height: 10,),
              Text('Profil'),
            ],
          ),
        ),
      ),
    );
  }
}
