import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterjanfeican/app/model/home_recipe.dart';
import 'package:flutterjanfeican/app/model/recipe_detail_model.dart';
import 'package:flutterjanfeican/app/route/route_list.dart';
import 'package:flutterjanfeican/common/http/src/api.dart';
import 'package:flutterjanfeican/common/http/src/base_http_request.dart';
import 'package:flutterjanfeican/common/http/src/base_http_response.dart';
import 'package:flutterjanfeican/common/http/src/base_net_image.dart';
import 'package:flutterjanfeican/common/resource/img_resources.dart';
import 'package:flutterjanfeican/common/resource/info_helper/info_helper.dart';
import 'package:flutterjanfeican/common/resource/info_helper/src/image_info_helper.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_color_config.dart';
import 'package:flutterjanfeican/common/uiconfig/ui_font_config.dart';

class MenuDetailController extends StatefulWidget {
  MenuDetailController({Key key}) : super(key: key);

  _MenuDetailControllerState createState() => _MenuDetailControllerState();
}

List<Map> _menuDetailList = [
  {
    'type': '0',
    'title': '手残党也能做出来的美味',
    'goodNum': '22',
    'collectNum': '1000',
    "author": '小食圆记',
    'info': '楚菜，湖北风味，以水产为主，鱼攥为主，支农前两，香鲜较辣'
  },
  {
    'type': '1',
    'title': '需要材料',
    'material_one': '大蒜',
    'material_two': '胡椒',
    'material_three': '辣椒'
  },
  {
    'type': '2',
    'title': '烹饪步骤',
    'step1': {'content': '鲫鱼收拾干净，表面划几刀'},
    'step2': {'content': '鲫鱼收拾干净，表面划几刀'},
    'material_two': {'content': '鲫鱼收拾干净，表面划几刀'}
  },
  {'type': '3', 'title': '相关菜谱'},
];

class _MenuDetailControllerState extends State<MenuDetailController> {
  RecipeDetailModel _recipeDetailModel;
  Recipe _recipe;

  Future<void> getRecipeData() async {
    BaseHttpResponse response = await httpRequest
        .getRequest(GetRecipeListByIds, data: {"ids": _recipe.id});
    _recipeDetailModel = RecipeDetailModel.fromJson(response.responseJson);
//    print(_homeRecipe.list[0].name);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _recipe = ModalRoute.of(context).settings.arguments;
    if (_recipeDetailModel == null) {
      getRecipeData();
    }
    if (_recipeDetailModel == null) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                child: getNetImageWithId(_recipe.imageid),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
              child: CustomScrollView(
                slivers: <Widget>[
                  _topImgView(),
                  _listView(),
            ],
          )),
          Positioned(
            child: Container(
              height: topBarHeight,
              child: GestureDetector(
                child: Image.asset(
                  getMenuDetailImagePath('back'),
                  width: 50,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topImgView() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 250,
        child: DecoratedBox(decoration: BoxDecoration()),
      ),
    );
  }

  Widget _listView() {
    return SliverPadding(
      padding: EdgeInsets.all(0),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (_recipeDetailModel != null) {
            return Container(
              child: MenuDetailHeadCell(
                model: _recipeDetailModel != null ? _recipeDetailModel : null,
                index: index,
                recipe: _recipe,
              ),
            );
          } else {
            return Container();
          }
        },
        childCount: 1,
      )),
    );
  }
}

class MenuDetailHeadCell extends StatelessWidget {
  MenuDetailHeadCell({Key key, this.model, this.recipe, this.index})
      : super(key: key);
  final RecipeDetailModel model;
  final Recipe recipe;
  final int index;
  @override
  Widget build(BuildContext context) {
    double _stepImgWidth = screenWidth - elementHorizontal * 2;
    if (model == null || recipe == null) {
      return Container();
    }
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? 20 : 0),
              topRight: Radius.circular(index == 0 ? 20 : 0)),
        ),
        child: Column(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? FuColor.homeSearchHintColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin: EdgeInsets.only(top: 14),
                  ),
                ]),
            Padding(
              padding: EdgeInsets.only(top: 16, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontSize: FuFont.largeFontSize,
                      color: FuColor.newsCellTitle,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      "已有${recipe.collectCount}人收藏  ${recipe.likeCount}人点赞",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: FuFont.baseFontSize,
                        color: FuColor.homeSearchHintColor,
                      ),
                    ),
                  ),

                  ///菜谱介绍
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          width: _stepImgWidth,
                          child: AspectRatio(
                            aspectRatio: 2.68,
                            child: ClipRRect(
                              child: Image.asset(
                                  getMenuDetailImagePath("xq_bg",
                                      format: "png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 16, left: 16),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: getNetImageWithId(
                                        recipe.authorimageid,
                                        size: Size.square(30),
                                      ),
                                    ),
                                    width: 30,
                                    height: 30,
                                  ),
                                  Padding(
                                    child: Text(
                                      recipe.authorname,
                                    ),
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                              child: Text(
                                recipe.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: FuColor.baseFontColor,
                                  fontSize: FuFont.baseFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///材料列表
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FuColor.detailBoxColor,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(0),
                      child: ClipRRect(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: FuColor.detailBoxColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 16, top: 20),
                                child: Text(
                                  "需要材料",
                                  style: TextStyle(
                                    color: FuColor.newsCellTitle,
                                    fontSize: FuFont.largeFontSize,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 10),
                                child: Column(
                                  children: buildMaterialList(
                                      model.list[0].materialList, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),

                  ///步骤列表
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "烹饪步骤",
                          style: TextStyle(
                            color: FuColor.newsCellTitle,
                            fontSize: FuFont.middlePlusFontSize,
                          ),
                        ),
                        Column(
                          children: buildStepList(
                              model.list[0].stepList, _stepImgWidth),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 0),
      ),
      onTap: () {},
    );
  }
}

///添加材料列表
List<Widget> buildMaterialList(List<MaterialList> materialList, int i) {
  List<Widget> widgets = [];
  for (var item in materialList) {
    widgets.add(Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          if (item.ordernum != 0)
            Container(
              decoration: BoxDecoration(color: FuColor.homeSearchHintColor),
              height: 0.5,
            ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  item.name,
                  style: TextStyle(
                    color: FuColor.baseFontColor,
                    fontSize: FuFont.nomalFontSize,
                  ),
                ),
                Text(
                  item.dosage,
                  style: TextStyle(
                    color: FuColor.baseFontColor,
                    fontSize: FuFont.nomalFontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
  return widgets;
}

///添加步骤
List<Widget> buildStepList(List<StepList> materialList, double _stepImgWidth) {
  List<Widget> widgets = [];
  for (var item in materialList) {
    widgets.add(Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Text(
              '${item.ordernum + 1}/${materialList.length}',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: SizedBox(
              width: _stepImgWidth,
              child: AspectRatio(
                aspectRatio: 1.63,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: getNetImageWithId(
                    item.imageid,
                    size: Size(_stepImgWidth, 1.63 / _stepImgWidth),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              item.details,
            ),
          ),
        ],
      ),
    ));
  }
  return widgets;
}
