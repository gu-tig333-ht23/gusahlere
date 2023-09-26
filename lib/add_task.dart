import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/my_button.dart';
import 'package:template/todo_mystate.dart';


class AddTask extends StatelessWidget {
  final _controller = TextEditingController();
  
//bakgrunden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 187, 208),
      appBar: AppBar(
          title: const Text("ADD TASK", style: TextStyle(fontSize: 25)),
          backgroundColor: const Color.fromARGB(255, 222, 107, 145)),
      body: Padding(
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
                    Provider.of<MyState>(context, listen: false).saveNewTask(enteredText);
                    _controller.clear();
                    Navigator.of(context).pop(); //spara det som skrivs in
                  },
                ),
              ),
            ],
          ),
      )
    )
    );
    
  }
}
