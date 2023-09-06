import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
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

// Nedan: där man kan skriva in ny uppgift

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Add task:',
                    hintStyle: TextStyle(color: Colors.white), //färg på texten man skriver in
                    enabledBorder: UnderlineInputBorder(      
                     borderSide: BorderSide(color: Colors.white), //färg på understrecket
                      ),  
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), //färg på understrecket när man ska skriva
                   ),  
                    ),
      
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    '+ ADD',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color.fromARGB(255, 222, 107, 145), //färg på knappen +ADD
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
