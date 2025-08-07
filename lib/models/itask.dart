class ITask{
  ITask({
    required this.title,
    required this.deadline,
    this.isComplete=false,
  });

  final String title;
  final String deadline;
  bool isComplete;
}
