import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterjanfeican/app/model/home_recipe.dart';
import 'package:flutterjanfeican/app/route/route_list.dart';
import 'package:flutterjanfeican/common/http/http_helper.dart';
import 'package:flutterjanfeican/common/resource/img_resources.dart';
import 'package:flutterjanfeican/common/resource/info_helper/src/color_info_helper.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_color_config.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_font_config.dart';

/// TODO 文件结构
/// TODO 命名 Dart Analysis
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> _headItemList;
  List<Map> _menuItemList;
  HomeRecipe _homeRecipe;
  int index =0;

  @override
  void initState() {
    getHomeData();
    // TODO: implement initState
    super.initState();
    print("initState");
  }

  void _initData() {
    _headItemList = [
      {"title": "减脂健身", "icon": "home_js"},
      {"title": "美容养颜", "icon": "home_my"},
      {"title": "营养素食", "icon": "home_ss"},
    ];
    _menuItemList = [
      {"title": "美味营养成功率高的一道家店铺，是很好吃的", "img": "home_js", "author_name": "聚香园"},
      {
        "title": "鸡腿肉，蛋白质的合成含量比例较高，种类多",
        "img": "home_my",
        "author_name": "小食园记"
      },
      {"title": "南瓜君属于葫芦科植物，营养价值不容小觑哦", "img": "home_ss", "author_name": "爱美食"},
    ];
  }

  Future<void> getHomeData() async {
    BaseHttpResponse response = await httpRequest.getRequest(
        GetContentsBySubClassId,
        data: {"id": "257352874", "page": "0"});
    _homeRecipe = null;
    _homeRecipe = HomeRecipe.fromJson(response.responseJson);
    index ++;
    print(_homeRecipe.list[0].name+'index:$index');
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    _initData();
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
        /* TODO 背景色
                圆角
         */
        child: Container(
          decoration: new BoxDecoration(
            color: FuColor.maskSubBackColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: new Border.all(width: 1, color: FuColor.maskSubBackColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(Images.getHomeImagePath(Images.homeTopSearchIcon)),
              /* TODO 文本样式
                      元素间距
               */
              Text(
                "搜索菜谱",
                style: TextStyle(
                    color: FuColor.homeSearchHintColor,
                    fontSize: FuFont.middleFontSize),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        ),
        onTap: () {
          Navigator.pushNamed(context, FuRouter.SearchRoute,
              arguments: 'search');
        },
      ),
      margin: EdgeInsets.fromLTRB(20, 44, 20, 0),
      height: 64,
    );
  }

  Widget headView() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: getHomeData,
        child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            /// EdgeInsets.all
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            sliver: new SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return HeadCell(
                    title: _headItemList[index]['title'],
                    icon: _headItemList[index]['icon'],
                  );
                },
                childCount: _headItemList.length,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            sliver: new SliverFixedExtentList(
              itemExtent: 335.0,
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return MenuItemListCell(
                  recipe: _homeRecipe != null?_homeRecipe.list[index] : null,
                  index: index,
                );
              }, childCount:_homeRecipe != null?_homeRecipe.list.length : 0),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class HeadCell extends StatelessWidget {
  HeadCell({Key key, this.title, this.icon}) : super(key: key);
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              child: Image.asset(Images.getHomeImagePath(icon)),
            ),
          ),
          Padding(
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
  MenuItemListCell({Key key, this.recipe,this.index})
      : super(key: key);
  final Recipe recipe;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              child: getNetImageWithId(recipe.imageid),
              borderRadius: BorderRadius.circular(16.0),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontSize: FuFont.largeFontSize,
                      color: FuColor.baseColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child:    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: getNetImageWithId(recipe.authorimageid, size: Size.square(25))
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child:   Text(
                            recipe.authorname,
                            style: TextStyle(
                              fontSize: FuFont.baseFontSize,
                              color: FuColor.baseColor,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 30),
      ),
      onTap: () {
        Navigator.pushNamed(context, FuRouter.MenuDetailRoute,
            arguments: recipe);
      },
    );
  }
}