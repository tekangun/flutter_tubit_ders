import 'package:firebase_auth/firebase_auth.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> hiveSave() async {
    await Hive.openBox('SignBox');
    var box = Hive.box('SignBox');
    await box.put('status', 1); // 1 ise giriş yapmış - 0 ise giriş yapmamış
    await box.put('email', emailController.text);
    await box.put('password', passwordController.text);
  }

  Future signIn(String _email, String _password) async {
    var auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      currentUserId = userCredential.user.uid;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(msg: 'Giriş Başarılı');
      await hiveSave();
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => NavBar()));
    } catch (error) {
      String message;

      if(error.hashCode == 505284406){
        message = 'Böyle bir kullanıcı bulunamadı';
      }
      else if(error.hashCode == 185768934){
        message = 'Hatalı Parola';
      }
      else if(error.hashCode == 360587416){
        message = 'Geçerli bir e-posta adresi giriniz';
      }
      else{
        print('Sign Hata: ${error.hashCode}');
      }
      Fluttertoast.showToast(msg: message);
    }
  }

  void login() async {
    if (_formKey.currentState.validate()) {
      await signIn(emailController.text, passwordController.text);
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
                            return 'Lütfen eposta adresinizi giriniz';
                          } else
                            return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'E-posta'),
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
