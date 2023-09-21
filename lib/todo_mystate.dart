import 'package:flutter/material.dart';
import 'package:template/todo_api.dart';

//här defineras våra tasks uppbyggnad som ska sparas i listan 
class ToDoItem {
  final String taskName;
  bool taskCompleted;
  final String? id;

  ToDoItem(
    this.taskName, {
    this.taskCompleted = false,
    this.id,
  });

//från API
factory ToDoItem.fromJson(Map<String, dynamic> json) {
  return ToDoItem(json['title'], 
  taskCompleted: json['done'], 
  id: json['id']);
}

Map<String, dynamic> toJson() {
  return {"title": taskName, "done": taskCompleted};
}

}
class MyState extends ChangeNotifier {

//listan
// ignore: prefer_final_fields
  List<ToDoItem> _toDoList = [];

  void fetchList() async {
    var toDoList = await API.fetchData();
    _toDoList = toDoList;
    notifyListeners();
  }

API apiMethods = API();

//checkboxen
void checkBoxChanged(toDoItem) async {
  toDoItem.taskCompleted = !toDoItem.taskCompleted;
  await apiMethods.updateTask(toDoItem);
  fetchList();
}

//nytt task
void saveNewTask(title) async {
  ToDoItem newToDoItem = ToDoItem(title);
  await apiMethods.postTask(newToDoItem);
  fetchList();
}

//ta bort task
void deleteTask(toDoItem) async {
  await apiMethods.removeTask(toDoItem);
  fetchList();
}

//filter
  String selectedFilter = '';

  String setFilter(String filt) {
    selectedFilter = filt;
    notifyListeners();
    return selectedFilter;
  }

  List<ToDoItem> get toDoList {
    switch (selectedFilter) {
      case 'all':
        return _toDoList.toList();
      case 'done':
        return _toDoList.where((element) => element.taskCompleted == true).toList();
      case 'undone':
        return _toDoList.where((element) => element.taskCompleted == false).toList();
      default:
        return _toDoList.toList();
    }
  }
}
 