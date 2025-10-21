import 'package:ristretto/core/models/ilist_skeleton.dart';
import 'package:ristretto/core/models/itask.dart';

class ITasksList extends IListSkeleton{
  final List<ITask> tasks;

  const ITasksList({
    required super.title,
    required this.tasks,
    required super.color,
    required super.icon,
  });
}
