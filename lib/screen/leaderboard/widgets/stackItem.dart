import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:math_app/model/player.dart';

class StackItem extends StatelessWidget {
  final int rank;
  final bool large;
  final Player player;
  const StackItem(
      {super.key,
      this.large = false,
      required this.rank,
      required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: large ? 110 : 80,
          height: large ? 110 : 80,
          child: Stack(
            children: [
              ClipPolygon(
                sides: 6,
                borderRadius: 8.0,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(3.0),
                  child: const ClipPolygon(
                    sides: 6,
                    borderRadius: 8.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  //padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    rank.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
        Text(
          player.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          player.score.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
