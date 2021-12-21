import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';
import 'package:flutter_clubhouse_ui/data.dart';

class UpcommingRooms extends StatelessWidget {
  final List<Room> rooms;
  const UpcommingRooms({
    Key? key,
    required this.rooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.secondaryBackground),
      child: Column(
        children: rooms
            .map((room) => Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(room.time),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 4, 0),
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
                            Text(room.name),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
