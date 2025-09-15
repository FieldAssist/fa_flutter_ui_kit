enum TaskStatus {
  completed,
  pending,
  draft,
  fail,
}

extension TaskStatusX on TaskStatus {
  String get name => {
        TaskStatus.completed: 'Completed',
        TaskStatus.pending: 'Pending',
        TaskStatus.draft: 'Draft',
        TaskStatus.fail: 'Failed',
      }[this]!;
}

TaskStatus taskStatusfromJson(String json) {
  if (json == 'Completed') {
    return TaskStatus.completed;
  } else if (json == 'Draft') {
    return TaskStatus.draft;
  } else if (json == 'Failed') {
    return TaskStatus.fail;
  } else {
    return TaskStatus.pending;
  }
}

String taskStatusToJson(TaskStatus qt) => qt.name;
