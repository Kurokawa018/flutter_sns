
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/details/rounded_button.dart';
//components
import 'package:flutter_udemy_sns/details/user_image.dart';
import 'package:flutter_udemy_sns/models/main/profile_model.dart';

// model
import 'package:flutter_udemy_sns/models/main_model.dart';

import '../../domain/firestore_user/firestore_user.dart';

import 'package:flutter_udemy_sns/constants/strings.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel
  }) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final int followerCount = firestoreUser.followerCount;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileModel.croppedFile == null ?
        UserImage(length: 100.0,userImageURL: mainModel.firestoreUser.userImageURL,)
            : ClipRRect(
          borderRadius: BorderRadius.circular(160.0),
          child: Image.file(profileModel.croppedFile!),
        ),
        Text("フォロー中${firestoreUser.followingCount.toString()}",style: const TextStyle(fontSize: 32.0),),
        Text(
          "フォロワー${followerCount.toString()}",
          style: const TextStyle(fontSize: 32.0),
        ),
        RoundedButton(
            onPressed: () async => await profileModel.uploadUserImage(currentUserDoc: mainModel.currentUserDoc),
            widthRate: 0.85,
            color: Colors.green,
            text: uploadText
        ),
      ],
    );
  }
}