import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FirebaseHomeState();

}

class FirebaseHomeState extends State<FirebaseHome>{
  var _firestore = FirebaseFirestore.instance;

  Stream setData(){
    _firestore.collection('users').doc('firstUser').update({
      'isim' : 'Mehmet',

    });
  }

  Future getData() async{
    DocumentSnapshot snapshot = await _firestore.collection('users').doc('firstUser').get();
    print(snapshot.data()['parola']);
  }

  void removeData() {
    _firestore.collection('users').doc('firstUser').delete();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase'),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('users').doc('firstUser').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot> snapshots){
          return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Text(snapshots.data.data()['isim'] ?? 'Veri Yok'),
            TextButton(onPressed: () => setData(), child: Text('Yaz')),
            TextButton(onPressed: () => getData(), child: Text('Getir')),
            TextButton(onPressed: () => removeData(), child: Text('Sil')),
          ],
        ),
      );

      },
      )
    );
  }

}