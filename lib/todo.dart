import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_mystate.dart';

//nanm på uppgift och om boxen är ikryssad eller ej
class ToDoTile extends StatelessWidget {
  final ToDoItem toDoItem;

  const ToDoTile({
    super.key,
    required this.toDoItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25, right: 25, top: 25), //mellanrum runt
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 222, 107, 145),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<MyState>().checkBoxChanged(toDoItem);
              },
              child: !toDoItem.taskCompleted
                  ? const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.check_box,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Text(
              //namn på uppgiften
              toDoItem.taskName,
              style: TextStyle(
                  fontSize: 18,
                  decoration: toDoItem.taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  color: Colors.white),
            )),
            IconButton(
              onPressed: () {
                context.read<MyState>().deleteTask(toDoItem);
              }, //för att kunna ta bort tasks
              icon: Icon(Icons.close),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
