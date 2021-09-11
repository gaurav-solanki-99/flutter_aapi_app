import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoUi extends StatefulWidget {
  const TodoUi({Key? key}) : super(key: key);

  @override
  _TodoUiState createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {



  Future<dynamic> getData() async
  {
      var res = await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: getData(),
            builder: (context,AsyncSnapshot  snapshot)
            {


              print(snapshot.error.toString());

                 if(snapshot.hasError)
                  {

                    return Center(
                      child: Text("Error in snapshot"),
                    );
                  }
                else if(snapshot.hasData)
                  {
                     print(snapshot.data);
                    return Center(
                      child: Container(
                         child: ListView.builder(


                           itemCount:  snapshot.data.length,
                           itemBuilder: (BuildContext context, int i) {
                               return ListTile(
                                 title: Text(snapshot.data[i]['userId'].toString()),
                               );
                           },



                         ),
                      ),
                    );
                  }
              return  Center(
                        child: CircularProgressIndicator(),
                   );


            },

        ),
    );
  }
}
