import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterjanfeican/src/resource/img_resources.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        topView(),
        headView(),
      ],
    );
  }
  Widget topView() {
    return Container(
      child: GestureDetector(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(Images.main_def),
              Text(
                "搜索菜谱",
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(20, 44, 20, 0),
        ),
      ),
      height: 64,
    );
  }
  Widget headView() {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding:  EdgeInsets.fromLTRB(20, 20, 20, 20),
            sliver: new SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
                return HeadCell(
                  title: "减脂廋身",
                );
              },
                childCount: 3,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            sliver:  new SliverFixedExtentList (
              itemExtent: 300,
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return MenuItemListCell();
                },
                childCount: 5
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class HeadCell extends StatelessWidget {
  HeadCell({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: ClipRRect(
                child: Image.asset(Images.main_def),
              ),
            ),
            Padding (
              child: Text(
                title,
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
    );
  }

}
class MenuItemListCell extends StatelessWidget {
  MenuItemListCell({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  child: Image.asset(Images.main_def),
                ),
              ),
              Text(
                "菜谱",
              ),
            ],
          ),
        margin: EdgeInsets.symmetric(vertical: 30),
      ),
    );
  }
}




