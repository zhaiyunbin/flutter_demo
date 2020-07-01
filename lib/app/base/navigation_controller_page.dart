import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterjanfeican/app/page/collection/collection_page.dart';
import 'package:flutterjanfeican/app/page/home/home_page.dart';
import 'package:flutterjanfeican/app/page/news/news_page.dart';
import 'package:flutterjanfeican/common/resource/img_resources.dart';

class NavigationController extends StatefulWidget{
  NavigationController({Key key, this.title}) : super(key: key);

  final String title;

  @override
  __NavigationControllerState createState() => __NavigationControllerState();
}

class __NavigationControllerState extends State<NavigationController> {
  int _selectIndex = 0;
  var _pageListWidget;

  void _initTab() {
    _pageListWidget = <Widget>[
      MyHomePage(),
      NewsController(),
      CollectionController(),
    ];
  }

  /// assets/tab/
  String getTabImagePath(String name, {String format: 'png'}) {
    return 'assets/tab/$name.$format';
  }
  Image getTabImage(String name, {String format: 'png'}) {
    return Image.asset(Images.getTabImagePath(Images.main));
  }
  @override
  Widget build(BuildContext context) {
    _initTab();
    return Scaffold(
      body: Center(
        child: _pageListWidget.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(Images.getTabImagePath(Images.mainDef)),
              activeIcon: Image.asset(Images.getTabImagePath(Images.main)),
              title: Text("首页")),
          BottomNavigationBarItem(
              icon: Image.asset(Images.getTabImagePath(Images.zxDef)),
              activeIcon: Image.asset(Images.getTabImagePath(Images.zx)),
              title: Text("资讯")),
          BottomNavigationBarItem(
              icon: Image.asset(Images.getTabImagePath(Images.collectionDef)),
              activeIcon: Image.asset(Images.getTabImagePath(Images.collection)),
              title: Text("收藏")),
        ],
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onItemClick,
      ),
    );
  }

  void onItemClick(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
