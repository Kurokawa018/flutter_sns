// flutter
import 'package:flutter/material.dart';
// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/domain/firestore_user/firestore_user.dart';
// constants
import 'package:flutter_udemy_sns/constants/strings.dart';

import '../../details/rounded_button.dart';
import '../../details/user_image.dart';
import '../../models/main_model.dart';
import '../../models/passive_user_profile_model.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  const PassiveUserProfilePage({
    Key? key,
    required this.passiveUser,
    required this.mainModel,
  }) : super(key: key);
  final FirestoreUser passiveUser;
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel = ref.watch(passiveUserProfileProvider);
    final bool isFollowing = mainModel.followingUids.contains(passiveUser.uid);
    final int followerCount = passiveUser.followerCount;
    final int plusOneFollowerCount = followerCount + 1;

    return Scaffold(
        appBar: AppBar(
          title: const Text(profileTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserImage(length: 100.0, userImageURL: passiveUser.userImageURL),
            Container(alignment: Alignment.center,child: Text(passiveUser.uid)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("フォロー中${passiveUser.followingCount.toString()}",style: const TextStyle(fontSize: 32.0),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                isFollowing ?
                "フォロワー${plusOneFollowerCount.toString()}"
                    : "フォロワー${followerCount.toString()}",
                style: const TextStyle(fontSize: 32.0),
              ),
            ),
            isFollowing ?
            RoundedButton(
                onPressed: () => passiveUserProfileModel.unfollow(mainModel: mainModel, passiveUser: passiveUser),
                widthRate: 0.85,
                color: Colors.red,
                text: "アンフォローする"
            )
                : RoundedButton(
                onPressed: () => passiveUserProfileModel.follow(mainModel: mainModel, passiveUser: passiveUser),
                widthRate: 0.85,
                color: Colors.green,
                text: "フォローする"
            )
          ],
        )
    );
  }
}