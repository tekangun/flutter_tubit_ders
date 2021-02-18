import 'package:flutter/material.dart';
import 'package:flutter_app/screens/sign_pages/login_page.dart';
import 'package:flutter_app/screens/sign_pages/registery_page.dart';
class SignCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign İşlemleri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  backgroundColor: Theme.of(context).appBarTheme.color),
              child: Container(
                alignment: Alignment.center,
                width: size.width * .4,
                padding: EdgeInsets.all(6),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
            ),
           SizedBox(height: 10,),
            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  backgroundColor: Theme.of(context).appBarTheme.color),
              child: Container(
                alignment: Alignment.center,
                width: size.width * .4,
                padding: EdgeInsets.all(6),
                child: Text(
                  'Kayıt Ol',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisteryPage())),
            ),
          ],
        ),
      ),
    );
  }
}
