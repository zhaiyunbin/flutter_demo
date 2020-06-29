import 'package:flutter/material.dart';
import 'package:flutterjanfeican/src/page/home_page.dart';
import 'package:flutterjanfeican/src/resource/img_resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String RootRoute = '/root';
  static final Map routes = <String, WidgetBuilder>{
    RootRoute: (BuildContext context) => NavigationController(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routes,
      initialRoute: RootRoute,
    );
  }
}

class NavigationController extends StatefulWidget {
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
      MyHomePage(),
      MyHomePage(),
    ];
  }

  /// assets/tab/
  String getTabImagePath(String name, {String format: 'png'}) {
    return 'assets/tab/$name.$format';
  }
  Image getTabImage(String name, {String format: 'png'}) {
    return Image.asset(Images.main);
  }
  @override
  Widget build(BuildContext context) {

    _initTab();
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: _pageListWidget.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(Images.main_def),
              activeIcon: Image.asset(Images.main),
              title: Text("首页")),
          BottomNavigationBarItem(
              icon: Image.asset(Images.zx_def),
              activeIcon: Image.asset(Images.zx),
              title: Text("推荐")),
          BottomNavigationBarItem(
              icon: Image.asset(Images.collection_def),
              activeIcon: Image.asset(Images.collection),
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
