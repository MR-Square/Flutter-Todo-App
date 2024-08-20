class Task {
  final int id;
  final String taskName;
  final bool? isCompleted;
  final bool? isCanceled;

  const Task({
    required this.id,
    required this.taskName,
    this.isCompleted,
    this.isCanceled,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['taskId'],
        taskName: json['taskName'],
        isCompleted: json['isCompleted'],
        isCanceled: json['isCanceled'],
      );

  // creating json method to convert task object to json format.
  Map<String, dynamic> toJson() => {
        "taskId": id,
        "taskName": taskName,
        "isCompleted": isCompleted,
        "isCanceled": isCanceled,
      };
}
