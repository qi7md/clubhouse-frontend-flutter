import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final ImageURL;
  final ImageSize;
  
  const UserProfileImage({
    Key? key,
    required this.ImageURL,
    this.ImageSize = 48.0,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ImageSize/2 + 5),
      child: Image.network(ImageURL, height: ImageSize, width: ImageSize, fit: BoxFit.cover,),
    );
  }
}