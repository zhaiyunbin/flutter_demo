import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterjanfeican/app/route/route_list.dart';
import 'package:flutterjanfeican/common/resource/img_resources.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_color_config.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_font_config.dart';

class MenuDetailControllers extends StatefulWidget {
  MenuDetailControllers({Key key}) : super(key: key);

  _MenuDetailControllerState createState() => _MenuDetailControllerState();
}

class _MenuDetailControllerState extends State<MenuDetailControllers>{
  List<Map> _menuDetailList = [
    {'type' : '4','title' : 'head'},
    {'type' : '0','title' : '手残党也能做出来的美味','goodNum' : '22','collectNum' : '1000',"author" : '小食圆记','info' : '楚菜，湖北风味，以水产为主，鱼攥为主，支农前两，香鲜较辣'},
    {'type' : '1','title' : '需要材料','material_one' : '大蒜','material_two' : '胡椒','material_three' : '辣椒'},
    {'type' : '2','title' : '烹饪步骤','step1' : {'content' : '鲫鱼收拾干净，表面划几刀'},'step2' : {'content' : '鲫鱼收拾干净，表面划几刀'},'material_two' : {'content' : '鲫鱼收拾干净，表面划几刀'}},
    {'type' : '3','title' : '相关菜谱'},

    ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
              child: CustomScrollView(
                  slivers: <Widget>[
//                    SliverPadding(
//                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
//                      sliver: Image(
////                      width: MediaQuery.of(context).size.width,
////                      height: MediaQuery.of(context).size.height * 1/3,
//                      image:AssetImage(Images.getHomeImagePath(Images.homeTest, format: "jpeg")),
//                      fit:BoxFit.fill,
//                    ),
//                    ),

                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      sliver: new SliverFixedExtentList(
                        itemExtent: 300,
                        delegate: new SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  if(_menuDetailList[index]['type'].toString()==("4")){
                                    return MenuDetailHeadImgCell();
                                  }else{
                                    return MenuDetailHeadCell(
                                      title: '22',
                                      authorName: '3333',
                                      index: index,
                                    );
                                  }
                            }, childCount: 5),
                      ),
                    ),

                  ],

                ),

          ),
        ],

      ),
    );
  }
}



class MenuDetailHeadImgCell extends StatelessWidget {
  MenuDetailHeadImgCell({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            /// TODO 背景图
            new DecoratedBox(
                decoration: BoxDecoration(
//                gradient: LinearGradient(colors: [Colors.white,Colors.green]),
                  image: new DecorationImage(
                      image: new AssetImage(
                          Images.getHomeImagePath(Images.homeTest, format: "jpeg")),
                      fit: BoxFit.fill),
                )),
          ],
        ),
      ),
      onTap: () {
      },
    );
  }
}
class MenuDetailHeadCell extends StatelessWidget {
  MenuDetailHeadCell({Key key, this.title, this.authorName, this.index})
      : super(key: key);
  final String title;
  final String authorName;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            /// TODO 背景图
            new DecoratedBox(
                decoration: BoxDecoration(
//                gradient: LinearGradient(colors: [Colors.white,Colors.green]),
                  image: new DecorationImage(
                      image: new AssetImage(
                          Images.getHomeImagePath(Images.homeTest, format: "jpeg")),
                      fit: BoxFit.cover),
                  borderRadius: new BorderRadius.all(Radius.circular(20)),
                )),
            Positioned(
              left: 20,
              right: 20,
              top: 24,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: FuFont.largeFontSize,
                  color: FuColor.baseColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Positioned(
              top: 64,
              left: 20,
              child: new SizedBox(
                width: 28,
                height: 28,
                child: ClipRRect(
                  borderRadius: new BorderRadius.all(Radius.circular(20)),
                  child:
                  Image.asset(Images.getHomeImagePath(Images.homeHeaderSs)),
                ),
              ),
            ),

            Positioned(
              top: 70,
              left: 56.0,
              child: Text(
                authorName,
                style: TextStyle(
                  fontSize: FuFont.baseFontSize,
                  color: FuColor.baseColor,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 30),
      ),
      onTap: () {
//        Navigator.pushNamed(context, FuRouter.MenuDetailRoute,
//            arguments: 'menu' + '$index');
      },
    );
  }
}

