import 'dart:io';

void main() {
  perform();
}

void perform() {
  task1();
  task2();
  task3();
}

void task1() {
  print("Task 1 is running....");
}

Future<void> task2() {
  Duration duration = Duration(seconds: 4);

  return Future.delayed(duration, () {
    print("Task 2 is running...");
  });
}

void task3() {
  print("Task 3 is running....");
}
