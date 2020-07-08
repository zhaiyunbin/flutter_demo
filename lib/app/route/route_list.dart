import 'package:flutter/widgets.dart';
import 'package:flutterjanfeican/app/base/navigation_controller_page.dart';
import 'package:flutterjanfeican/app/page/menu_datail_pages.dart';
import 'package:flutterjanfeican/app/page/collection/collection_page.dart';
import 'package:flutterjanfeican/app/page/home/home_search_page.dart';
import 'package:flutterjanfeican/app/page/news/news_page.dart';

class FuRouter {
  static const String RootRoute = '/root';
  static const String SearchRoute = '/root/home/search';
  static const String NewsRoute = '/root/news';
  static const String CollectionRoute = '/root/collection';
  static const String MenuDetailRoute = '/root/menu_detail';

  static final Map routes = <String, WidgetBuilder>{
    RootRoute : (BuildContext context) => NavigationController(),
    SearchRoute : (BuildContext context) => HomeSearchController(),
    NewsRoute : (BuildContext context) => NewsController(),
    CollectionRoute : (BuildContext context) => CollectionController(),
    MenuDetailRoute : (BuildContext context) => MenuDetailController()
  };

}