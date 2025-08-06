import 'package:flutter/material.dart';
import 'package:ristretto/models/itask.dart';

class IList{
  const IList({
    required this.title,
    required this.tasks,
    required this.color,
    required this.icon,
  });

  final String title;
  final List<ITask> tasks;
  final Color color;
  final IconData icon;
}
