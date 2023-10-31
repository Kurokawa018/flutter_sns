import 'package:flutter/cupertino.dart';

class CircleImage extends StatelessWidget {
  CircleImage({
    Key? key,
    required this.length,
    required this.image,
  }) : super(key: key);
  final double length;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        image: DecorationImage(image: image),
      ),
    );
  }
}