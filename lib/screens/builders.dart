import 'package:flutter/material.dart';

class Builders extends StatefulWidget {
  @override
  _BuildersState createState() => _BuildersState();
}

class _BuildersState extends State<Builders> {
  List<Map> maps =
      List.generate(20, (index) => {"id": index, "Name": "İsim $index"});

  void gridViewOnpressed(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.info_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Flutter Ders',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ayarlar',style: TextStyle(color: Colors.black, fontSize: 24)),
                  Text('Hakkımızda',style: TextStyle(color: Colors.black, fontSize: 24)),
                  Text('Hakkımızda',style: TextStyle(color: Colors.black, fontSize: 24)),
                  Text('Hakkımızda',style: TextStyle(color: Colors.black, fontSize: 24)),
                  Text('Hakkımızda',style: TextStyle(color: Colors.black, fontSize: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Builders'),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () => Navigator.pop(context),
              ),
              InkWell(
                child: Icon(Icons.info_outline),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Text(
                'ListView Builder',
                style: TextStyle(fontSize: 32),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                color: Colors.blue.shade200,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  itemCount: maps.length,
                  itemBuilder: (context, index) {
                    return Text(
                      maps[index]['Name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32),
                    );
                  },
                ),
              ),
              Text(
                'GridView Builder',
                style: TextStyle(fontSize: 32),
              ),
              GridView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: maps.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => gridViewOnpressed(index),
                    child: Container(
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.pink,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/gridView_background.jpg',
                              ),
                              fit: BoxFit.cover)),
                      alignment: Alignment.center,
                      child: Text(
                        maps[index]['Name'],
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
