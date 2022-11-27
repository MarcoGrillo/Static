class Task {
  final String id;
  final String subfolderId;
  final String title;
  final String description;
  final bool completed;

  const Task({
    required this.id,
    required this.subfolderId,
    required this.title,
    required this.description,
    required this.completed,
  });
}
