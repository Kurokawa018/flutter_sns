// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/models/main_model.dart';
// constants
import '../constants/strings.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({
    Key? key,
    required this.mainModel
  })
      : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(accountTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(logoutText),
            onTap: () async => await mainModel.logout(context: context),
          )
        ],
      ),
    );
  }
}