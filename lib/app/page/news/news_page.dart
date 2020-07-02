import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterjanfeican/common/resource/img_resources.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_color_config.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_font_config.dart';

class NewsController extends StatefulWidget {
  NewsController({Key key}) : super(key: key);

  _NewsControllerState createState() => _NewsControllerState();
}


class _NewsControllerState extends State<NewsController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List _newsTabList ;
  List<Map> _newsChannelList ;
  String _test;
  void _intData(){
    _newsTabList = ['美食', '健康', '星座', '美文', '美食', '健康', '星座', '美文'];
    _newsChannelList= [
      {"title": "美味营养成功率高的一道家店铺，是很好吃的是很好吃的是很好吃的", "img": "home_js", "type": "1"},
      {"title": "鸡腿肉，蛋白质的合成含量比例较高是很好吃的是很好吃的，种类多", "img": "home_my", "type": "0"},
      {"title": "南瓜君属于葫芦科植物，营养价值不容小觑哦", "img": "home_ss", "type": "1"},
      {"title": "美味营养成功率高的一道家店铺，是很好吃的", "img": "home_js", "type": "1"},
      {"title": "鸡腿肉，蛋白质的合成含量比例较高，种类多", "img": "home_my", "type": "0"},
      {"title": "南瓜君属于葫芦科植物，营养价值不容小觑哦", "img": "home_ss", "type": "1"},
    ];
    _test = "3333";
  }
  @override
  void initState() {
    // TODO: implement initState
    print("type====initState");
    super.initState();
    _intData();
    _tabController = TabController(length: _newsTabList.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: <Widget>[

        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.fromLTRB(0, 44, 0, 0),
          child: new TabBar(
            indicatorColor: FuColor.themeColor,
            labelColor: FuColor.themeColor,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            controller: _tabController,
            tabs: _newsTabList.map((e) => Tab(text: e)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _newsTabList.map((item) {
              return Stack(
                children: <Widget>[
//                    Align(alignment:Alignment.topCenter,child: Text(item.toString()),),
                  newsChannelStack()
                ],
              );
            }).toList(),
          ),
        )
      ],
    ));
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
                      if(_newsChannelList[index]['type'].toString()==("1")){
                        return NewsChannelCell(title: _newsChannelList[index]['title']);
                      }else{
                        return NewsChannelTypeCell(title: _newsChannelList[index]['title']);
                      }
                },
                childCount: _newsChannelList.length,
              ),
              itemExtent: 200,
            ),
          ),
        ],
      ),
        onRefresh: (){
          return _reFreshPull().then((value) {
            print('success');
            setState(() {
               _test = "4444";
               print("type====setState");
            });
          }).catchError((error) {
            print('failed');
          });
        },
      )
    );
  }
}

class NewsChannelCell extends StatelessWidget{
  NewsChannelCell({Key key,this.title}) : super(key : key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: LayoutBuilder(
        builder: (context ,constrains){
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.green,Colors.green]),
                  )),
              Positioned(
                child: Text(
                  title,
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
                        width: (constrains.maxWidth - 8 * 2) / 3,
                        height: (constrains.maxWidth - 8 * 2) / 3,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.all(Radius.circular(25)),
                          child:
                          Image.asset(Images.getMenuImagePath(Images.menuTest)),
                        ),
                      ),
                    ),
                    Container(
                      child: new SizedBox(
                        width: (constrains.maxWidth - 8 * 2) / 3,
                        height: (constrains.maxWidth - 8 * 2) / 3,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.all(Radius.circular(25)),
                          child:
                          Image.asset(Images.getMenuImagePath(Images.menuTest)),
                        ),
                      ),
                    ),
                    Container(
                      child: new SizedBox(
                        width: (constrains.maxWidth - 8 * 2) / 3,
                        height: (constrains.maxWidth - 8 * 2) / 3,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.all(Radius.circular(25)),
                          child:
                          Image.asset(Images.getMenuImagePath(Images.menuTest)),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          );
        }

      ),
      margin: EdgeInsets.fromLTRB(0,0,0,30),
    );

  }

}
class NewsChannelTypeCell extends StatelessWidget{
  NewsChannelTypeCell({Key key,this.title}) : super(key : key);
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

_reFreshPull() async {
  await Future.delayed(new Duration(seconds: 3));
}



