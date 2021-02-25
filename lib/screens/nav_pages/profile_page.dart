import 'package:flutter/material.dart';
import 'package:flutter_app/main_nav_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var name = "";

  void loadDefaults() async{
    await Hive.openBox('SignBox');
    var box = Hive.box('SignBox');
    if(mounted){
      setState(() {
        name = box.get('username');
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
              Text('Kullanıcı Adı: $name'),
              SizedBox(height: 10,),
              Text('Profil'),
            ],
          ),
        ),
      ),
    );
  }
}
