class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String description;
  String id;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.id = '',
    this.description = '',
    this.isDone = false,
  });
}
