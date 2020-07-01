import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterjanfeican/app/route/route_list.dart';


import 'navigation_controller_page.dart';

class NavigationPage extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: FuRouter.routes,
        initialRoute:FuRouter.RootRoute,
      );
    }

}