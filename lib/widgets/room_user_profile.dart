import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class RoomUserProfile extends StatelessWidget {
  final User user;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    Key? key,
    required this.user,
    required this.isNew,
    required this.isMuted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              child: UserProfileImage(
                ImageURL: user.imageUrl,
                ImageSize: 66.0,
              ),
            ),
            if (isNew)
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "🎉",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4)
                        ]),
                  )),
            if (isMuted)
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(CupertinoIcons.mic_slash_fill)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4)
                        ]),
                  ))
          ],
        ),
        Flexible(
          child: Text(user.givenName, overflow: TextOverflow.ellipsis,),
        ),
      ],
    );
  }
}
