import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:template/todo_mystate.dart';


const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String myKey = '0c22b841-213b-49ff-ad96-c3798b2818ed';

//API
class API {
  static Future<List<ToDoItem>> fetchData() async {
    Uri url = Uri.parse('$ENDPOINT/todos?key=$myKey');

    http.Response response = await http.get(url);
    String body = response.body;

    List<dynamic> jsonResponse = jsonDecode(body);
    List<ToDoItem> todoList =
        jsonResponse.map((json) => ToDoItem.fromJson(json)).toList();

    return todoList;
  }

//skapa task 
  Future<void> postTask(ToDoItem toDoItem) async {
    await http.post(Uri.parse('$ENDPOINT/todos?key=$myKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(toDoItem.toJson()));
  }

//ta bort task
  Future<void> removeTask(toDoItem) async {
    var id = toDoItem.id;
    await http.delete(Uri.parse('$ENDPOINT/todos/$id?key=$myKey'));
  }

//ändra task
  Future<void> updateTask(ToDoItem toDoItem) async {
    var id = toDoItem.id;
    await http.put(Uri.parse('$ENDPOINT/todos/$id?key=$myKey'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(toDoItem.toJson()));
  }
}

