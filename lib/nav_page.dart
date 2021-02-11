import 'package:flutter/material.dart';
import 'package:flutter_app/screens/builders.dart';
import 'package:flutter_app/screens/kayit_ekle_sil_guncelle_list.dart';

class NavPage extends StatelessWidget {
  List<String> titles = ["Kayıt Ekle-Güncelle", "Listview Builder"];

  void onPressedMethod(BuildContext context, var index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KayitEkleSilGuncelleList()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Builders()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bölümler"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10.0),
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, index) {
                      return TextButton(
                        child: Text(
                          titles[index],
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () => onPressedMethod(context,index),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
