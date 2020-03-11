import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CrudListView(),
    );
  }
}

class CrudListView extends StatefulWidget {
  CrudListViewState createState() => CrudListViewState();
}

class CrudListViewState extends State<CrudListView> {
  TextEditingController textController = TextEditingController();

  List<String> listViewData = [];

  onSubmit() {
    setState(() {
      listViewData.add(textController.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD operations'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter text to add',
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: onSubmit,
              child: Text('Add Item to List'),
              color: Colors.red,
            ),
          ),
          Expanded(
              child: new ListView.builder(
            itemCount: listViewData.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return ListTile(
                leading: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 55,
                    height: 55,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/edit.png'),
                    ),
                  ),
                ),
                title: Text(listViewData[index]),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      listViewData.removeAt(index);
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 35,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/delete.png'),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
