import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollectionController extends StatefulWidget{
  CollectionController({Key key}) : super(key : key);
  _CollectionControllerState createState() => _CollectionControllerState();

}

class _CollectionControllerState extends State<CollectionController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ),
      body: Container(
        child: Builder(builder: (context) {
          return  Text("args");
        }),
      ),
    );
  }
}