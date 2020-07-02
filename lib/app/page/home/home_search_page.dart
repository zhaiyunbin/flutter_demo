import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSearchController extends StatefulWidget {
  HomeSearchController({Key key}) : super(key: key);
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _HomeSearchControllerState();
//  }
  @override
  _HomeSearchControllerState createState() => _HomeSearchControllerState();
}

class _HomeSearchControllerState extends State<HomeSearchController> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Container(
        child: Builder(builder: (context) {
          return Text(args);
        }),
      ),
    );
  }
}
