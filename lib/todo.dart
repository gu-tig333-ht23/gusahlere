import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
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
              value: taskCompleted, onChanged: onChanged,
              checkColor: Color.fromARGB(255, 222, 107, 145), //färg på V
              activeColor: Colors.white, //färg på innehållet i box
              side: BorderSide(color: Colors.white),
            ), //checkbox
            //value = true/false om man utfört eller ej, onChanged = tillåter att det ändras

            Expanded(
                child: Text(
              //namn på uppgiften
              taskName,
              style: TextStyle(
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  color: Colors.white),
            )),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.close),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
