// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/constants/strings.dart';
import 'package:flutter_udemy_sns/domain/firestore_user/firestore_user.dart';

final searchProvider = ChangeNotifierProvider(
    ((ref) => SearchModel()
    ));

class SearchModel extends ChangeNotifier {

  List<FirestoreUser> users = [];
  SearchModel() {
   init();
  }

  Future<void> init() async {
    final qshot = await FirebaseFirestore.instance.collection("users").get();
    final List<DocumentSnapshot<Map<String,dynamic>>> docs = qshot.docs;
    users = docs.map((e) => FirestoreUser.fromJson(e.data()!)).toList();
  }
}