import 'package:memo/model/task.dart';

class Storage {
  static List<Task> taskLists = [];

  static void createTask(String taskName) =>
      taskLists.add(Task(taskName: taskName));
}
