import 'dart:io';

void main() {
  performTasks();
  task4();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration pauseAsec = Duration(seconds: 3);
  String result;

  await Future.delayed(pauseAsec, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2result) {
  String result = task2result;
  print('Task 3 complete - $result');
}

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}
