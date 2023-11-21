class Player {
  int id;
  String name;
  int score;
  int lastUpdate; 

  Player({
    required this.id,
    required this.name,
    required this.score,
    required this.lastUpdate,
  });

  // Chuyển đổi đối tượng Player thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'lastUpdate': lastUpdate,
    };
  }

  // Hàm tạo từ Map
  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'],
      name: map['name'],
      score: map['score'],
      lastUpdate: map['lastUpdate'],
    );
  }
}
