//intとString以外のものをreturn
//package
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_udemy_sns/constants/strings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile> returnXFile() async {
  final ImagePicker picker = ImagePicker();
// Pick an image.
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
}

Future<File?> returnCroppedFile({ required XFile? xFile}) async {
  final instance = ImageCropper();
  final File? result = await instance.cropImage(
      sourcePath: xFile!.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      androidUiSettings: const AndroidUiSettings(
        toolbarColor: Colors.green,
        toolbarTitle: cropperTitle,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false
      ),
    iosUiSettings: const IOSUiSettings(
        title: cropperTitle
    )
  );
  return result;

}