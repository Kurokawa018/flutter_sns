// flutter
import 'package:flutter/material.dart';
// package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// domain
import 'package:flutter_udemy_sns/constants/strings.dart';
import 'package:flutter_udemy_sns/domain/firestore_user/firestore_user.dart';
import 'package:flutter_udemy_sns/domain/following_token/following_token.dart';
// model
import 'package:flutter_udemy_sns/models/main_model.dart';

final passiveUserProfileProvider = ChangeNotifierProvider(
    ((ref) => PassiveUserProfileModel()
    ));

class PassiveUserProfileModel extends ChangeNotifier {
  Future<void> follow({required MainModel mainModel,required FirestoreUser passiveUser }) async {
    // settings
    mainModel.followingUids.add(passiveUser.uid);
    final String tokenId = returnUuidV4();
    final Timestamp now = Timestamp.now();
    final FollowingToken followingToken = FollowingToken(createdAt: now,passiveUid: passiveUser.uid,tokenId: tokenId);
    final FirestoreUser activeUser = mainModel.firestoreUser;
    // 自分がフォローした印
    await FirebaseFirestore.instance.collection("users").doc(activeUser.uid).collection("tokens").doc(tokenId).set(followingToken.toJson());
  }

  Future<void> unfollow({required MainModel mainModel,required FirestoreUser passiveUser }) async {
    mainModel.followingUids.remove(passiveUser.uid);
    // followしているTokenを取得する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    // qshotというdataの塊の存在を存在を取得
    final QuerySnapshot<Map<String, dynamic>>  qshot = await FirebaseFirestore.instance.collection("users").doc(activeUser.uid).collection("tokens").where("passiveUid",isEqualTo: passiveUser.uid).get();
    // 1個しか取得してないけど複数している扱い
    final List<DocumentSnapshot<Map<String,dynamic>>> docs = qshot.docs;
    final DocumentSnapshot<Map<String, dynamic>> token  = docs.first;
    await token.reference.delete();
  }
}