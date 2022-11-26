import 'package:flutter/cupertino.dart';

class Task {
  final String id;
  final String subfolderId;
  final String title;
  final String description;

  const Task({
    required this.id,
    required this.subfolderId,
    required this.title,
    required this.description,
  });
}
