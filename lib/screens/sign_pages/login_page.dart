import 'package:flutter/material.dart';
import 'package:flutter_app/screens/constants.dart';
import 'package:flutter_app/screens/nav_pages/nav_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> hiveSave() async {
    await Hive.openBox('SignBox');
    var box = Hive.box('SignBox');
    await box.put('status', 1); // 1 ise giriş yapmış - 0 ise giriş yapmamış
    await box.put('username', usernameController.text);
    await box.put('password', passwordController.text);
  }

  void login() async {
    String message;
    if (_formKey.currentState.validate()) {
      print(users[1][0]);
      FocusScope.of(context).unfocus();
      for (List<String> user in users) {
        if (user[0] == usernameController.text) {
          if (user[1] == passwordController.text) {
            await hiveSave();
            message = 'Giriş Başarılı';
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (_) => NavBar()));
          } else
            message = 'Hatalı parola';
        } else
          message = 'Böyle bir kullanıcı bulunamadı';
      }
      Fluttertoast.showToast(msg: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Giriş Yap'),
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
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Lütfen kullanıcı adınızı giriniz';
                          } else
                            return null;
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
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Lütfen parolanızı giriniz';
                          } else
                            return null;
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
                            'Giriş Yap',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        onPressed: () => login(),
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
