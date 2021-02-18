import 'package:flutter/material.dart';
import 'package:flutter_app/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisteryPage extends StatefulWidget {
  @override
  _RegisteryPageState createState() => _RegisteryPageState();
}

class _RegisteryPageState extends State<RegisteryPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void startRegistery(){
    if(_formKey.currentState.validate()){
      FocusScope.of(context).unfocus();
      users.add([usernameController.text,passwordController.text]);
      Fluttertoast.showToast(msg: 'Kayıt Başarılı');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Kayıt Ol'),
        ),
        body: Center(
          child: Container(
            width: size.width * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Lütfen kullanıcı adınızı giriniz';
                          }
                          else return null;
                        },
                        controller: usernameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Kullanıcı Adı'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Lütfen parolanızı giriniz';
                          }
                          else return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Parola'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            backgroundColor:
                                Theme.of(context).appBarTheme.color),
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * .4,
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Kayıt Ol',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        onPressed: () => startRegistery(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
