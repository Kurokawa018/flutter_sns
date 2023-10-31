//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/constants/others.dart';
//page
import 'package:image_picker/image_picker.dart';

final ProfileProvider = ChangeNotifierProvider(
        (ref) => ProfileModel());

class ProfileModel extends ChangeNotifier{
  XFile? xFile;
  Future<void> pickImage() async{
    xFile = await returnXFile();
  }
}