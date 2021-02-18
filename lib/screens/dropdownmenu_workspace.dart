import 'package:flutter/material.dart';

class DropDownMenuPage extends StatefulWidget {
  @override
  _DropDownMenuPageState createState() => _DropDownMenuPageState();
}

class _DropDownMenuPageState extends State<DropDownMenuPage> {
  var _value = 0;
  List<ListItem> _dropDownItems = List.generate(
    10, (index) => ListItem(index + 1, '${index + 1}. Seçenek'),);

  List<DropdownMenuItem<ListItem>> _dropDownMenuItems;
  ListItem _selectedItem;


  void loadDefaults() {
     _dropDownMenuItems = buildDropDownMenuItems(_dropDownItems);
    _selectedItem = _dropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();

    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(listItem.title),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    loadDefaults();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownMenu'),
        actions: [
          PopupMenuButton(
            onSelected: (choice) {
              print(choice);
            },
            itemBuilder: (BuildContext context) {
              return {'Hakkımda', 'Ayarlar'}.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * .8,
              child: DropdownButton(
                  isExpanded: true,
                  value: _selectedItem,
                  items: _dropDownMenuItems,
                  onChanged: (ListItem newValue) {
                if (mounted) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                }
                print(newValue.title);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String title;

  ListItem(this.value, this.title);
}
