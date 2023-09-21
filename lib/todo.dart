import 'package:flutter/material.dart';

//nanm på uppgift och om boxen är ikryssad eller ej
class ToDoItem {
  String taskName;
  bool taskCompleted;

  ToDoItem({
    required this.taskName,
    required this.taskCompleted,
  });
}

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final ToDoItem toDoItem;
  Function(bool?)? onChanged;
  Function() onDelete;

  ToDoTile({
     super.key,
    required this.toDoItem,
    required this.onChanged,
    required this.onDelete,
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
            Checkbox(
              value: toDoItem.taskCompleted, onChanged: onChanged,
              checkColor: Color.fromARGB(255, 222, 107, 145), //färg på V
              activeColor: Colors.white, //färg på innehållet i box
              side: BorderSide(color: Colors.white),
            ), //checkbox
            //value = true/false om man utfört uppgiften eller ej, onChanged = tillåter att det ändras

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
              onPressed: () {onDelete();}, //för att kunna ta bort tasks
              icon: Icon(Icons.close),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
