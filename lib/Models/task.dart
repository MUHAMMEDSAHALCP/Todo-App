//To describe how every task could be.

class Task {
  String name;
  bool isDone;
  Task({
    required this.name,
    this.isDone = false,
  });

  // This methode simply toggles the done-ness of the task.

  void toggleDone() {
    isDone = !isDone;
  }
}
