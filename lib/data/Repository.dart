import 'package:to_do_application/Objects/Task.dart';

class Repository {
 static List<Task> tasks = [
    Task(
        Id: 1, Description: 'Description 1', isComplete: false, Title: 'Task1'),
    Task(
        Id: 2, Description: 'Description 2', isComplete: false, Title: 'Task2'),
    Task(
        Id: 3, Description: 'Description 3', isComplete: false, Title: 'Task3'),
    Task(
        Id: 4, Description: 'Description 4', isComplete: false, Title: 'Task4'),
    Task(Id: 1, Description: 'Description 5', isComplete: false, Title: 'Task5')
  ];
}
