//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

//constants
import 'package:flutter_udemy_sns/constants/routes.dart'as route;
import 'package:flutter_udemy_sns/models/main_model.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginModel());

class LoginModel extends ChangeNotifier{
  String email = "";
  String password = "";
  bool isObscure = true;


  Future<void> login({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      route.toMyApp(context: context);
    } on FirebaseAuthException catch(e) {
      print(e.toString());
    }
  }
  void toggleIsObsucure() {
    isObscure =! isObscure;
    notifyListeners();
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
