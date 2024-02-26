import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async{
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async{
  Duration threeSec = Duration(seconds: 3);
  String result = 'dummytask2data';
  // sleep(threeSec); //sleep method is synchronous
  //asynchronous way of doing tasks is through Future.delayed(Duration duration). It happens in the background
  //and the tasks that can be immediately completed are executed.
  await Future.delayed(threeSec, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

//In a case where a task needs some input from its previous task, we need async await
void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}

//Futures are similar to receipts. Suppose we order some coffee and they give us a receipt. 
//We can wait for the coffee to be made while sitting somewhere else checking instagram.
//We can later claim our cup of coffee on the counter based on our receipt number.
//Future or recipt is not the actually thing that you want. Its just a promise that you'll get it in the future.