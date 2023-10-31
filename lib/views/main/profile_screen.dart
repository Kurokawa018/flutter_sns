import 'package:flutter/cupertino.dart';
//components
import 'package:flutter_udemy_sns/details/user_image.dart';

// model
import 'package:flutter_udemy_sns/models/main_model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
    required this.mainModel
}) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: UserImage(length: 100.0,userImageURL: mainModel.fireStoreUser.userImageURL,),
    );
  }
}