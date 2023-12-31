// flutter
import 'package:flutter/material.dart';
// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:flutter_udemy_sns/constants/strings.dart';
import 'package:flutter_udemy_sns/constants/routes.dart' as routes;
// domain
import 'package:flutter_udemy_sns/domain/firestore_user/firestore_user.dart';

import '../domain/firestore_user/firestore_user.dart';

final mainProvider = ChangeNotifierProvider(
        (ref) => MainModel()
);

class MainModel extends ChangeNotifier {
  bool isLoading = false;
  User? currentUser;
  late DocumentSnapshot<Map<String,dynamic>> currentUserDoc;
  late FirestoreUser firestoreUser;

  List<String> followingUids = [];
  //以下がMainModelが起動した時の処理
  // ユーザーの動作を必要としないモデルの関数
  MainModel() {
    init();
  }
  // initの中でcurrentUserを更新すれば良い
  Future<void> init() async {
    startLoading();
    // modelを跨がないでcurrentUserの更新
    currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser!.uid);
    // hcbXO8Rs4PPGua2vlPL92XTmpJj1
    currentUserDoc = await FirebaseFirestore.instance.collection(usersFieldKey).doc(currentUser!.uid).get();
    print(currentUserDoc.data());
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);
    // currentUserのuidの取得が可能になりました
    endLoading();
  }
  void startLoading() {
    isLoading = true;
    notifyListeners();
  }
  void endLoading() {
    isLoading = false;
    notifyListeners();
  }
  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser();
    routes.toLoginPage(context: context);
  }
}