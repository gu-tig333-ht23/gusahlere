import 'package:flutter/material.dart';
import 'package:template/add_task.dart';
import 'package:template/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //lista av todo saker
  List ToDoList = [
    ["Pussas", false],
    ["Kramas", false],
    ["Sprida kärlek", false],
  ];

//checkbox ikryssad
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
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
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                icon: Icon(
                  Icons.more_vert,
                ))
          ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        }, //pop up ^
        backgroundColor: Color.fromARGB(255, 222, 107, 145),
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}

//Pop up-fönster:
Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Filter'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Text("All"), Text("Done"), Text("Not Done")],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
        style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 222, 107, 145),),
      ),
    ],
  );
}
