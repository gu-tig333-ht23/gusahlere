import 'package:flutter/material.dart';
import 'package:template/add_task.dart';
import 'package:template/filter.dart';
import 'package:template/view_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        return MyFilter();
                      
                      });
                },
                icon: Icon(
                  Icons.more_vert, 
                ))
          ]),

//knapp för add task
     floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddTask();
            },
            ),
            ),
  
        backgroundColor: Color.fromARGB(255, 222, 107, 145),
        
        child: Icon(Icons.add)
     ),
  
        body: const ViewMyList(),
      );
}
}
