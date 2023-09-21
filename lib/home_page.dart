import 'package:flutter/material.dart';
import 'add_task.dart';
import 'filter.dart';
import 'todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskFilter currentFilter = TaskFilter.All;

  //lista av todo saker
  List<ToDoItem> toDoList = [];

  //navigera till AddTask och lägga till tasks
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddTask()))
        .then((value) {
      if (value != null && value.isNotEmpty) {
        //kan inte lägga till en tom uppgift
        toDoList.add((ToDoItem(taskName: value, taskCompleted: false)));
        setState(() {}); // Uppdatera homepage
      }
    });
  }

//funktion som filtrerar tasks enligt alternativen i filtret
List<ToDoItem> filterTasks() {
  switch (currentFilter) {
    case TaskFilter.All:
      return toDoList;
    case TaskFilter.Done:
      return toDoList.where((task) => task.taskCompleted).toList();
    case TaskFilter.Undone:
      return toDoList.where((task) => !task.taskCompleted).toList();
    default:
      return toDoList;
  }
}


//checkbox ikryssad
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index].taskCompleted = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //hela bakgrunden
      backgroundColor: Color.fromARGB(255, 249, 187, 208),
      appBar: AppBar(
          title: Text("TO DO", style: TextStyle(fontSize: 25)),
          backgroundColor: const Color.fromARGB(255, 222, 107, 145),
          actions: [
            //filterikonen
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return MyFilter(onFilterSelected: (filter) {
                          setState(() {
                            currentFilter = filter;
                          });
                          Navigator.of(context).pop();
                        });
                      });
                },
                icon: Icon(
                  Icons.more_vert, 
                ))
          ]),

//knapp för add task
     floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNextScreen(context);
        }, 
        backgroundColor: Color.fromARGB(255, 222, 107, 145),
        child: Icon(Icons.add),
      ),

//för att visa filterTasks (listan där tasks blir uppdelade enligt filtret)
      body: ListView.builder(
        itemCount: filterTasks().length,
        itemBuilder: (context, index) {
          final filteredTasks = filterTasks();
          return ToDoTile(
              toDoItem: filteredTasks[index],
              onChanged: (bool? newValue) {
                checkBoxChanged(newValue, toDoList.indexOf(filteredTasks[index]));
              },
              onDelete: () {
                if (index >= 0 && index < filteredTasks.length) {
                  setState(() {
                    toDoList.removeAt(toDoList.indexOf(filteredTasks[index]));
                  });
                }
              });
        },
      ),
    );
  }
}
