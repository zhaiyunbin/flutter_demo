import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterjanfeican/common/resource/img_resources.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_color_config.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_font_config.dart';

class CollectionController extends StatefulWidget {
  CollectionController({Key key}) : super(key: key);
  _CollectionControllerState createState() => _CollectionControllerState();
}

class _CollectionControllerState extends State<CollectionController> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List  _collectTabList = ['收藏', '阅读历史'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _collectTabList.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Positioned(
            child: Padding(padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).padding.top,0,0),
              child:  Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                        ),
                        alignment: Alignment.center,
                        child: new TabBar(
                          indicatorColor: FuColor.themeColor,
                          labelColor: FuColor.themeColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: Colors.black,
                          isScrollable: true,
                          controller: _tabController,
                          tabs: _collectTabList.map((e) => Tab(text: e)).toList(),
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: _collectTabList.map((item) {
                        return Stack(
                          children: <Widget>[
//                    Align(alignment:Alignment.topCenter,child: Text(item.toString()),),
                            newsChannelStack()
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).padding.top,30,0),
              child: Align(
                alignment: Alignment.topRight,
                child:MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: new Text('测试'),
                  onPressed: () {
                  },
                ) ,
              ),
            ),
          )
        ],
      )


    );
    }
  Widget newsChannelStack() {
    return Container(
        child: RefreshIndicator(child: new CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: new SliverFixedExtentList(
                delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return CollectListCell();
                  },
                  childCount: 20,
                ),
                itemExtent: 200,
              ),

            ),

          ],

        ),
          onRefresh: (){
            return _reFreshPull().then((value) {
              print('success');

            }).catchError((error) {
              print('failed');
            });
          },
        )
    );
  }

  }


_reFreshPull() async {
  await Future.delayed(new Duration(seconds: 3));
}


  class CollectListCell extends StatelessWidget{
    CollectListCell({Key key,this.title}) : super(key : key);
  final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green,Colors.green]),
              )),
          Positioned(
            child: Text(
              "杭州天香楼的东坡肉、楼外楼的西湖醋鱼名扬中外。在这些杭帮老字号里",
              style: TextStyle(
                fontSize: FuFont.middleFontSize,
                color: FuColor.newsCellTitle,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Positioned(
            top: 56,
            left: 0,
            right: 0,
            child: Row(
              //均分横轴
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: new SizedBox(
                    width: 106,
                    height: 106,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.all(Radius.circular(20)),
                      child:
                      Image.asset(Images.getMenuImagePath(Images.menuTest)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(0,0,0,30),
    );

  }

}

