import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/details/rounded_button.dart';
//components
import 'package:flutter_udemy_sns/details/user_image.dart';
import 'package:flutter_udemy_sns/models/main/profile_model.dart';

// model
import 'package:flutter_udemy_sns/models/main_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel
}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileModel.xFile == null ?
        Container(
        alignment: Alignment.center,
          child: UserImage(length: 100.0,userImageURL: mainModel.firestoreUser.userImageURL,),
        )
            : Text("Loading"),
        RoundedButton(
            onPressed: () async => await profileModel.uploadUserImage(currentUserDoc: mainModel.currentUserDoc),
            widthRate: 0.85,
            color: Colors.green,
            text: "upload")
          ],
    );

  }
}