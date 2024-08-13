class Task {
  final int id;
  final String title;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        isCompleted: json['isCompleted'],
      );

  // creating json method to convert task object to json format.
  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "isCompleted" : isCompleted,
  };
}
