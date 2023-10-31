// flutter
import 'package:flutter/material.dart';
// package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

//domain
import 'package:flutter_udemy_sns/domain/firestore_user/firestore_user.dart';

//constans
import 'package:flutter_udemy_sns/constants/strings.dart';

final signupProvider = ChangeNotifierProvider(
        (ref) => SignupModel()
);

class SignupModel extends ChangeNotifier {
  int counter = 0;
  User? currentUser = null;
  //auth
  String email = "";
  String password = "";
  bool isObscure = true;
  Future<void> createFirestoreUser({required BuildContext context,required String uid}) async {
    // final uuid = Uuid();
    // final String v4 = uuid.v4();
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
      createdAt: now,
      updatadAt: now,
      userName: aliceName,
      uid: uid,
      email: email,
    );
    final Map<String, dynamic> userData = firestoreUser.toJson();
    // final Map<String,dynamic> userData = {
    //   "userName": "Alice",
    //   "uid": v4,
    // };
    await FirebaseFirestore.instance.collection(usersFieldKey).doc(uid).set(userData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userCreatedMsg)));
    notifyListeners();
  }

  Future<void> createUser({required BuildContext context}) async {
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObsucure() {
    isObscure =! isObscure;
    notifyListeners();
  }

}