import 'package:akademi_yanimda/pages/home_screen.dart';
import 'package:akademi_yanimda/pages/login_screen.dart';
import 'package:akademi_yanimda/pages/register_screen.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  navigateToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return HomePage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hesabınız var mı?", style: Styles.headerStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: Text("Gelişmeye devam et", style: Styles.subHeaderStyle),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: Styles.buttonDecoration,
                child: Center(
                  child: Text("Giriş Yap", style: Styles.buttonTextStyle),
                ),
              ),
            ),
            Divider(height: 80),
            Text("Buralarda yeni misin?", style: Styles.headerStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: Text("Öğrenmeye hemen başla", style: Styles.subHeaderStyle),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen())),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: Styles.buttonDecoration.copyWith(color: Colors.transparent, border: Border.all(color: Styles.buttonColor)),
                child: Center(
                  child: Text(
                    "Kayıt Ol",
                    style: Styles.buttonTextStyle.copyWith(color: Styles.buttonColor),
                  ),
                ),
              ),
            ),
            GoogleSignButton()
          ],
        ),
      ),
    );
  }

  Widget GoogleSignButton() {
    return ElevatedButton(
        onPressed: () async {
          await signInWithGoogle();
          String uid = FirebaseAuth.instance.currentUser!.uid;
          await FirebaseFirestore.instance.collection('kullanicilar').doc(uid).set(
            {'girisYaptiMi': true, 'sonGirisTarihi': FieldValue.serverTimestamp()},
            SetOptions(merge: true),
          );
          navigateToHome();
        },
        child: Text("Google ile Giriş Yap"));
  }
}