import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:akademi_yanimda/pages/home.dart';
import 'package:akademi_yanimda/services/auth_service.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> registerForm = {};
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  bool isSaving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Kayıt Ol",
                style: Styles.headerStyle,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  CustomAuthField(
                      label: "Ad Soyad",
                      controller: fullnameController,
                      validator: (p0) {
                        if (p0?.isNotEmpty != true) {
                          return 'Ad soyad girmeniz gerekli';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        registerForm['fullName'];
                      }),
                  CustomAuthField(
                      label: "Kullanıcı Adı",
                      controller: nicknameController,
                      validator: (p0) {
                        if (p0?.isNotEmpty != true) {
                          return 'Kullanıcı adı girmeniz gerekli';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        registerForm['nickName'];
                      }),
                  CustomAuthField(
                      label: "Mail",
                      validator: (p0) {
                        if (p0?.isNotEmpty != true || (p0?.isNotEmpty == true && !p0!.contains('@')) || (p0?.isNotEmpty == true && !p0!.contains('.'))) {
                          return 'Gerçek bir mail girmeniz gerekli';
                        }
                        return null;
                      },
                      controller: mailController,
                      onSaved: (newValue) {
                        registerForm['mail'];
                      }),
                  CustomAuthField(
                      label: "Şifre",
                      obsecure: true,
                      validator: (p0) {
                        if (p0?.isNotEmpty != true || (p0?.isNotEmpty == true && p0!.length < 6)) {
                          return 'Girdiğiniz şifre en az 6 karakter içermelidir.';
                        }
                        return null;
                      },
                      controller: passwordController,
                      onSaved: (newValue) {
                        registerForm['password'];
                      }),
                  SizedBox(height: 50),
                  isSaving
                      ? Center(child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () async {
                            setState(() {
                              isSaving = true;
                            });
                            final formState = _formKey.currentState;
                            if (formState == null) return;

                            if (formState.validate()) {
                              formState.save();
                              print(registerForm);
                            }
                            int success = await AuthService.instance
                                .register(context: context, email: mailController.text, password: passwordController.text, fullName: fullnameController.text, nickName: nicknameController.text);
                            if (success == 1) {
                              await FirebaseAuth.instance.currentUser?.updateDisplayName(fullnameController.text);
                              setState(() {
                                isSaving = false;
                              });
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return HomeBar();
                                },
                              ));
                            }
                            setState(() {
                              isSaving = false;
                            });
                          },
                          child: MainButton(isFilled: true, title: "Kayıt Ol"))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAuthField extends StatelessWidget {
  const CustomAuthField({super.key, required this.controller, this.onSaved, required this.label, this.validator, this.obsecure = false});
  final String label;
  final bool obsecure;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obsecure,
        validator: validator,
        style: Styles.classicTextStyle,
        controller: controller,
        decoration: InputDecoration(
            label: Text(
          label,
          style: Styles.hintStyle,
        )),
        onSaved: onSaved);
  }
}
