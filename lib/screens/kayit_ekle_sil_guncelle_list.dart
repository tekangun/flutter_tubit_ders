import 'package:flutter/material.dart';

class KayitEkleSilGuncelleList extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => KayitEkleSilGuncelleListState();

}

class KayitEkleSilGuncelleListState extends State<KayitEkleSilGuncelleList>{
  String alttaraf = "";
  TextEditingController _listeYazisi = TextEditingController();
  List<String> kaydedilenListe = [];
  List<Widget> widgetListesi = [];
  bool isShowButton = false;
  int selectedIndex;


  removeWidget(int index){
    setState(() {
      kaydedilenListe.removeAt(index);

    });

  }

  updateWidget(){
    setState(() {
      kaydedilenListe[selectedIndex] = _listeYazisi.text;
      isShowButton = false;
    });
  }

  editWidget(int index){
    setState(() {
      isShowButton = true;
      _listeYazisi.text = kaydedilenListe[index];
      selectedIndex = index;
    });
  }
  listWidget(Size size,int index){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10,),
              Text(kaydedilenListe[index],style: TextStyle(fontWeight: FontWeight.w600),),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){
                  editWidget(index);
                },
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: (){
                  removeWidget(index);
                },
              ),
            ],
          )
        ],
      ),

    );
  }

  save(){
    setState(() {
      kaydedilenListe.add(_listeYazisi.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Girdileri Listeleme"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: _listeYazisi,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )

                ),

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Offstage(
                  offstage: isShowButton,
                  child: FlatButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () =>{
                      save(),
                    },
                    child: Text("Kaydet",style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width: 10,),
                isShowButton ? FlatButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () =>{
                    updateWidget(),
                  },
                  child: Text("Değiştir",style: TextStyle(color: Colors.white),),
                ) : Container(width: 0,),

              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),

              ),
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: size.width,
              height: size.height * .6,
              child: ListView.builder(
                itemCount: kaydedilenListe.length,
                itemBuilder: (context,index){
                  return listWidget(size, index);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

}