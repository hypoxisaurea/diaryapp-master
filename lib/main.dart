import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'My Diary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemBuilder:(context, index){
            return Container(height:80, child:
            ListTile(
              title: Text('제목 입력',
              style: TextStyle(fontSize:17.0, fontWeight:FontWeight.bold)),
                  subtitle: Text('내용 입력',
                      style: TextStyle(fontSize:14.0)),
              trailing: Icon(Icons.keyboard_arrow_right)
            ));
          }
        ),
        floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add, color:Colors.white),
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailDiaryPage()),
          );
          },
    )
    );
  }
}

class DetailDiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diary',
        style: TextStyle(
          fontSize: 24.0,
        )),
      ),
      body: Row(children: <Widget>[
        Flexible(
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '제목'
                  ),
                )),
              Container(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '내용'
                   ),
                ))
            ],
          ),
        )]),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.save, color: Colors.white,)),
    );
  }
}