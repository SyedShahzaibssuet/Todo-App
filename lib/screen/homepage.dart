import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  TodoAppstate createState() => TodoAppstate();
}

class TodoAppstate extends State<TodoApp> {
  var result = '';
  List<String> mytodolist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
        actions: [
          Icon(Icons.login_rounded),
          Padding(padding: EdgeInsets.only(right: 15)),          
          Icon(Icons.notification_add_rounded),
          Padding(padding: EdgeInsets.only(right: 15)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: mytodolist.length,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.all(5.0),
              height: 70,
              child: ListTile(
                title: Text('${mytodolist[index]}',style: TextStyle(color: Colors.black,fontSize: 14),),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                      onTap: (){
                        setState(() {
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Edit Todo'),
                              content: TextField(
                                onChanged: (value){
                                  result = value;
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      mytodolist.replaceRange(index, index+1, {result});
                                    });
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Center(child: Center(child: Text('Edit'))),
                                )
                              ],
                            );
                          });
                        });
                      },
                      child: Icon(Icons.edit)),
                      GestureDetector(
                      onTap: (){
                        setState(() {
                          mytodolist.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete)),
                    ]
                  ),
                ),
                ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text('Add New Item in your Todo'),
              content: TextField(
                onChanged: (value){
                  result = value;
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      mytodolist.add(result);
                    });
                    Navigator.of(context).pop();
                  }, 
                  child: Center(child: Text('Update List')),
                )
              ],
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
