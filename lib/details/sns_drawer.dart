// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// constants
import '../constants/routes.dart' as routes;
import '../constants/strings.dart';

//model
import '../models/main_model.dart';
import '../models/themes_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({
    Key? key,
    required this.mainModel,
    required this.themeModel,
  }) : super(key: key);
  final MainModel mainModel;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text(accountTitle),
            onTap: () => routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
            title: const Text(themeTitle),
            trailing: CupertinoSwitch(
              value: themeModel.isDarkTheme,
              onChanged: (value) => themeModel.setIsDarkTheme(value: value)
            ),
          ),
        ],
      ),
    );
  }
}