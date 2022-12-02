import 'package:flutter/material.dart';
import 'package:static_app/models/task.dart';

class Subfolder {
  final String id;
  final String folderId;
  final String title;
  final List<Color> colors;
  final List<Task> tasks;

  const Subfolder({
    required this.id,
    required this.folderId,
    required this.title,
    required this.colors,
    required this.tasks,
  });
}
