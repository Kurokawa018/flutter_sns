// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:flutter_udemy_sns/domain/firestore_user/firestore_user.dart';
import 'package:flutter_udemy_sns/models/main/search_model.dart';
import 'package:flutter_udemy_sns/constants/routes.dart' as routes;

import '../../models/main_model.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({
    Key? key,
    required this.mainModel
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);

    return ListView.builder(
      itemCount: searchModel.users.length,
      itemBuilder: (context, index) {
        final FirestoreUser firestoreUser = searchModel.users[index];
        return ListTile(title: Text(firestoreUser.uid),onTap: () => routes.toPassiveUserProfilePage(context: context, passiveUser: firestoreUser,mainModel: mainModel),);
      },
    );
  }
}