import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/screens/room_screen.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true, builder: (_) => RoomScreen(room: room))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (room.club.isNotEmpty)
                  Text(
                    '${room.club} 🏠'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.5, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 20.0,
                                top: 28.0,
                                child: UserProfileImage(
                                    ImageURL: room.speakers[1].imageUrl)),
                            UserProfileImage(
                                ImageURL: room.speakers[0].imageUrl)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map((e) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  '${e.familyName}, ${e.givenName} 💭',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 16.0),
                                ),
                              ))
                        ],
                      ),
                      flex: 3,
                    )
                  ],
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '${room.speakers.length + room.others.length + room.followedBySpeakers.length} ',
                  ),
                  WidgetSpan(
                      child: Icon(
                    CupertinoIcons.person_fill,
                    size: 17,
                    color: Colors.grey,
                  )),
                  TextSpan(text: " / ${room.speakers.length} "),
                  WidgetSpan(
                      child: Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    size: 17,
                    color: Colors.grey,
                  )),
                ], style: TextStyle(color: Colors.grey))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
