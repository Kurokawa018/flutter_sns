import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udemy_sns/details/circle_image.dart';

class UserImage extends StatelessWidget {
  UserImage({
    Key? key,
    required this.length,
    required this.userImageURL,
  }) : super(key: key);
  final double length;
  final String userImageURL;

  @override
  Widget build(BuildContext context) {
    //与えられたUserimageが空の時に表示
    return userImageURL.isEmpty ? 
      Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
          border:Border.all(color: Colors.green),
          shape: BoxShape.circle
      ),
      child: Icon(
          Icons.person,
          size: length,
      ),
    ) : CircleImage(length: length, image: NetworkImage(userImageURL));
  }
}