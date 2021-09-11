import 'dart:async';
import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aapi_app/todoui.dart';
import 'package:http/http.dart' as http;
import 'Album.dart';
import 'Photo.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   Future<void> getData() async
   {
     // var res = await  http.get(Uri.parse("https://api.github.com/users/desi-programmer"));
     
     var res = await http.post(Uri.parse(	"http://dummy.restapiexample.com/api/v1/create"),body: jsonEncode({"name":"test","salary":"123","age":"23"}),
     headers: {"Content-Type":"text/plain"});

       print(res.statusCode);

       print(res.body);


   }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
       return SafeArea(
           child: Scaffold(
           body:
             Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                         RaisedButton(
                           child: Text("Make a Request"),
                             onPressed: (){
                                  getData();
                         }),
                       Text("Response"),
                       RaisedButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TodoUi()));
                       },
                       child: Text("UI Activity "),)
                     ],
                 ),
             ),
           ),
       );
  }





}
