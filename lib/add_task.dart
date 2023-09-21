import 'package:flutter/material.dart';
import 'my_button.dart';

class AddTask extends StatelessWidget {
//bakgrunden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 187, 208),
      appBar: AppBar(
          title: const Text("ADD TASK", style: TextStyle(fontSize: 25)),
          backgroundColor: const Color.fromARGB(255, 222, 107, 145)),
      body: const AddTaskForm(),
    );
  }
}

//där man kan skriva in ny uppgift
class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskState();
}

//för att kunna spara ny uppgift
class _AddTaskState extends State<AddTaskForm> {
  final _controller = TextEditingController();

  void saveNewTask(val) {
    setState(() {
      Navigator.of(context)
          .pop(_controller.text); //spara det som skrivs in och ta med tillbaka
    });
  }

//format och dekoration för textfältet
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 25, right: 25, top: 25, bottom: 450), //mellanrum runt

        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 222, 107, 145),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _controller,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Add task:',
                  hintStyle: TextStyle(
                      color: Colors.white), //färg på texten man skriver in
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), //färg på understrecket
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), //färg på understrecket när man ska skriva
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MyButton(
                  text: "+ADD",
                  onPressed: () {
                    String enteredText = _controller.text;
                    saveNewTask(enteredText); //spara det som skrivs in
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
