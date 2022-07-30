class Data {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;
  Data({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}
