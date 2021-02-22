import 'package:Hello/src/widget/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/image_model.dart';
import 'dart:convert';
import 'widget/image_list.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');

    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Imagelist(images),
        appBar: AppBar(
          title: Text('Hello saiihok'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
