import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/room_user_profile.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(CupertinoIcons.chevron_down),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.doc,
                color: Colors.black,
              )),
          GestureDetector(
            onTap: () {
              print("ho");
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: UserProfileImage(
                  ImageURL: currentUser.imageUrl,
                  ImageSize: 38.0,
                )),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: Colors.white),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          '${room.club} 🏠'.toUpperCase(),
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(CupertinoIcons.ellipsis))
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      room.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            SliverPadding(
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                children: room.speakers
                    .map((speaker) => RoomUserProfile(
                          user: speaker,
                          isMuted: Random().nextBool(),
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
              padding: EdgeInsets.all(20),
            ),
            SliverToBoxAdapter(
                child: Text(
              "followed by speakers",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey),
            )),
            SliverPadding(
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20.0,
                children: room.followedBySpeakers
                    .map((speaker) => RoomUserProfile(
                          user: speaker,
                          isMuted: false,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
              padding: EdgeInsets.all(20),
            ),
            SliverToBoxAdapter(
                child: Text(
              "others",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey),
            )),
            SliverPadding(
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 20.0,
                children: room.others
                    .map((speaker) => RoomUserProfile(
                          user: speaker,
                          isMuted: false,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
              padding: EdgeInsets.all(20),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 120))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
        height: 110,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap:() => Navigator.of(context).pop(),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "✋🏽 Leave quietly",
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(40)),
              padding: EdgeInsets.all(15),
              child: Icon(CupertinoIcons.add, size: 25,),
            )
          ],
        ),
      ),
    );
  }
}
