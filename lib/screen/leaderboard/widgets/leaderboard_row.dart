import 'package:flutter/material.dart';

class LeaderboardRow extends StatelessWidget {
  final int rank;
  final String imageAsset;
  final String name;
  final int score;

  const LeaderboardRow({
    super.key,
    required this.rank,
    required this.imageAsset,
    required this.name,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Text(
                  '$rank.',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(width: 20),
                CircleAvatar(backgroundImage: AssetImage(imageAsset)),
                const SizedBox(width: 20),
                Text(name, style: const TextStyle(fontSize: 15)),
                const Spacer(),
                Text('$score', style: const TextStyle(fontSize: 15)),
                const SizedBox(width: 20),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
