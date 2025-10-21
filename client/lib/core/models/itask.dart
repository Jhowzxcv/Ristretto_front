class ITask{
  final String title;
  final DateTime deadline;
  bool isComplete;

  ITask({
    required this.title,
    required this.deadline,
    this.isComplete=false,
  });

  void toggleState(){
    isComplete=!isComplete;
  }
}
