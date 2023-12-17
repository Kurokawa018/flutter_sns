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

import '../../domain/firestore_user/firestore_user.dart';
import '../../domain/following_token/following_token.dart';
import '../main_model.dart';

final profileProvider = ChangeNotifierProvider(
        (ref) => ProfileModel());

class ProfileModel extends ChangeNotifier{
  File? croppedFile;

  Future<String> uploadImageAndGetURL( {required String uid, required File file}) async {
    final String fileName = returnJpgFileName();
    final Reference storegeRef = FirebaseStorage.instance.ref().child("users").child(uid).child(fileName);
    //users/uid/ファイル名にアップロード
    await storegeRef.putFile(file);
    //users/uid/ファイル名のURLを取得
    return await storegeRef.getDownloadURL();
  }

  Future<void> uploadUserImage({ required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    final XFile xFile = await returnXFile();
    final String uid = currentUserDoc.id;
    final File file = File(xFile!.path);
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await currentUserDoc.reference.update({
      "userImageURL" : url,
    });
    notifyListeners();
  }

  Future<void> follow({required MainModel mainModel,required FirestoreUser passiveFirestoreUser }) async {
    // settings
    mainModel.followingUids.add(passiveFirestoreUser.uid);
    notifyListeners();
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final FollowingToken followingToken = FollowingToken(createdAt: now,passiveUid: passiveFirestoreUser.uid,tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    // 自分がフォローした印
    await FirebaseFirestore.instance.collection("users").doc(activeUser.uid).collection("tokens").doc(tokenId).set(followingToken.toJson());
  }

  Future<void> unfollow({required MainModel mainModel,required FirestoreUser passiveFirestoreUser }) async {
    mainModel.followingUids.remove(passiveFirestoreUser.uid);
    notifyListeners();
    // followしているTokenを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    // qshotというdataの塊の存在を存在を取得
    final QuerySnapshot<Map<String, dynamic>>  qshot = await FirebaseFirestore.instance.collection("users").doc(activeUser.uid).collection("tokens").where("passiveUid",isEqualTo: passiveFirestoreUser.uid).get();
    // 1個しか取得してないけど複数している扱い
    final List<DocumentSnapshot<Map<String,dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token  = docs.first;
    await token.reference.delete();
  }
}