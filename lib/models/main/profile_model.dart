//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/constants/others.dart';
import 'package:flutter_udemy_sns/constants/strings.dart';
//page
import 'package:image_picker/image_picker.dart';

final profileProvider = ChangeNotifierProvider(
        (ref) => ProfileModel());

class ProfileModel extends ChangeNotifier{
  XFile? xFile;
  Future<void> pickImage() async{
    xFile = await returnXFile();
  }

  Future<String> uploadImageAndGetURL( {required String uid, required File file}) async {
    final String fileName = returnJpgFileName();
    final Reference storegeRef = FirebaseStorage.instance.ref().child("users").child(uid).child(fileName);
    //users/uid/ファイル名にアップロード
    await storegeRef.putFile(file);
    //users/uid/ファイル名のURLを取得
    return await storegeRef.getDownloadURL();
  }

  Future<void> uploadUserImage({ required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    xFile = await returnXFile();
    final String uid = currentUserDoc.id;
    final File file = File(xFile!.path);
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await currentUserDoc.reference.update({
      "userImageURL" : url,
    });
    notifyListeners();
  }
}