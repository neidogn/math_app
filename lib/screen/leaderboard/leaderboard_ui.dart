import 'package:flutter/material.dart';
import 'package:math_app/db/sql_helper.dart';
import 'package:math_app/model/player.dart';
import 'package:math_app/screen/leaderboard/widgets/leaderboard_row.dart';
import 'package:math_app/screen/leaderboard/widgets/stackItem.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromARGB(255, 218, 85, 104),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.white,
        child: Stack(
          children: [
            renderTop3(),
            Positioned(
              top: 180,
              left: 30,
              right: 30,
              bottom: 30,
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 20),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    renderRank(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //renderRank(),
    );
  }

  Widget renderTop3() {
    return Stack(
      children: [
        Container(
          //margin: EdgeInsets.only(left: 10, right: 10),
          height: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 218, 85, 104),
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: FutureBuilder<Player?>(
            future: DatabaseHelper.getPlayerAtRank(2),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final player = snapshot.data;
                return player != null
                    ? StackItem(
                        large: false,
                        rank: 2,
                        player: player,
                      )
                    : const SizedBox();
              }
            },
          ),
        ),
        Positioned(
          top: 5,
          left: 150,
          child: FutureBuilder<Player?>(
            future: DatabaseHelper.getPlayerAtRank(1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final player = snapshot.data;
                return player != null
                    ? StackItem(
                        large: true,
                        rank: 1,
                        player: player,
                      )
                    : const SizedBox();
              }
            },
          ),
        ),
        Positioned(
          top: 50,
          right: 30,
          //alignment: Alignment(0.5),
          child: FutureBuilder<Player?>(
            future: DatabaseHelper.getPlayerAtRank(3),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final player = snapshot.data;
                return player != null
                    ? StackItem(
                        large: false,
                        rank: 3,
                        player: player,
                      )
                    : const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget renderRank() {
    return Expanded(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper.getLeaderboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final leaderboard = snapshot.data;
            return ListView.builder(
              itemCount: leaderboard!.length,
              itemBuilder: (context, index) {
                final player = leaderboard[index];
                return LeaderboardRow(
                  rank: index + 1,
                  imageAsset: 'assets/images/avatar.jpg',
                  name: player['name'],
                  score: player['score'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
