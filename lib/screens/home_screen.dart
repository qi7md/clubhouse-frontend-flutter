import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/room_card.dart';
import 'package:flutter_clubhouse_ui/widgets/upcomminng_rooms.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:IconButton(
          icon: const Icon(
            CupertinoIcons.search
            ),
             onPressed: () {  },
             color: Colors.black,
             ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.envelope_open),
            onPressed: () {  },
            color: Colors.black,
            iconSize: 22,
             ),
             IconButton(
          icon: const Icon(CupertinoIcons.calendar),
             onPressed: () {  },
             color: Colors.black,
             ),
             IconButton(
          icon: const Icon(CupertinoIcons.bell),
             onPressed: () {  },
             color: Colors.black,
             ),

             GestureDetector(
               onTap: (){print("ho");},
               child: Container(
                 margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                 child: UserProfileImage(ImageURL: currentUser.imageUrl, ImageSize: 38.0,)),
             )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              UpcommingRooms(rooms: upcomingRoomsList),
              SizedBox(height: 20,),
              ...roomsList.map((e) => RoomCard(room: e)).toList(),
              SizedBox(height: 20,)
            
            ],
            
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                  ]
                )
              ),
            ),
          ),

          Positioned(
            bottom: 60,
            child: Container(
              decoration: BoxDecoration(color: Colors.green[700], borderRadius: BorderRadius.circular(40.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text.rich(TextSpan(
                  children: [
                    WidgetSpan(child: Icon(CupertinoIcons.add, color: Colors.white,)),
                    TextSpan(text: " Create Room !", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold))
                  ],
                )),
              ),
              )
          ),

          Positioned(
            bottom: 70,
            right: 35,
            child: Icon(CupertinoIcons.circle_grid_3x3_fill, size: 35, color: Colors.grey,)
            )
        ],
      ),
    );
  }
}