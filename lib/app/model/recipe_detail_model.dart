/// state : "200"
/// list : [{"hasVideo":false,"imageid":"264669352","materialList":[{"dosage":"150g","contentid":"264669350","mwikipediaid":"","name":"泡发黑木耳","ordernum":0,"id":"6763273","version":0},{"dosage":"2个","contentid":"264669350","mwikipediaid":"","name":"鸡蛋","ordernum":1,"id":"6763274","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"孜然粉","ordernum":2,"id":"6763275","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"盐","ordernum":3,"id":"6763276","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"鸡精","ordernum":4,"id":"6763277","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"生抽","ordernum":5,"id":"6763278","version":0}],"description":"","stepList":[{"imageid":"264669353","contentid":"264669350","details":"准备好泡发黑木耳","ordernum":0,"id":"9273679","time":0,"version":0},{"imageid":"264669355","contentid":"264669350","details":"如果木耳太大，可以改刀切一下","ordernum":1,"id":"9273680","time":0,"version":0},{"imageid":"264669356","contentid":"264669350","details":"鸡蛋打散，搅拌至冒泡备用","ordernum":2,"id":"9273681","time":0,"version":0},{"imageid":"264669357","contentid":"264669350","details":"开始烹饪\n热锅烧油，要比平时炒菜至少多放一倍的油，要不然鸡蛋扑不起来","ordernum":3,"id":"9273682","time":0,"version":0},{"imageid":"264669358","contentid":"264669350","details":"油烧热，开中火倒入鸡蛋","ordernum":4,"id":"9273683","time":0,"version":0},{"imageid":"264669359","contentid":"264669350","details":"两面煎至金黄撒少许盐翻炒","ordernum":5,"id":"9273684","time":0,"version":0},{"imageid":"264669361","contentid":"264669350","details":"用铲子将鸡蛋捣碎盛出备用","ordernum":6,"id":"9273685","time":0,"version":0},{"imageid":"264669363","contentid":"264669350","details":"锅中炒鸡蛋剩余的油炒木耳","ordernum":7,"id":"9273686","time":0,"version":0},{"imageid":"264669365","contentid":"264669350","details":"加入少许盐翻炒均匀","ordernum":8,"id":"9273687","time":0,"version":0},{"imageid":"264669368","contentid":"264669350","details":"倒入鸡蛋","ordernum":9,"id":"9273688","time":0,"version":0},{"imageid":"264669370","contentid":"264669350","details":"加水一丢丢(加水是为了避免木耳翻炒的时候有炸裂的声音)","ordernum":10,"id":"9273689","time":0,"version":0},{"imageid":"264669372","contentid":"264669350","details":"此时可以加入调料，十三香适量","ordernum":11,"id":"9273690","time":0,"version":0},{"imageid":"264669374","contentid":"264669350","details":"鸡精适量","ordernum":12,"id":"9273691","time":0,"version":0},{"imageid":"264669391","contentid":"264669350","details":"味极鲜或者生抽少许","ordernum":13,"id":"9273692","time":0,"version":0},{"imageid":"264669392","contentid":"264669350","details":"孜然粉比其他调料多1倍的量","ordernum":14,"id":"9273693","time":0,"version":0},{"imageid":"264669394","contentid":"264669350","details":"混合翻炒均匀即可出锅","ordernum":15,"id":"9273694","time":0,"version":0},{"imageid":"264669395","contentid":"264669350","details":"装盘上桌","ordernum":16,"id":"9273695","time":0,"version":0}],"video":null,"authorid":"263505855","version":"1","url":null,"tags":"家常菜,快手菜,素菜,鸡蛋","tipList":[{"contentid":"264669350","details":"","ordernum":0,"id":"849842","version":0}],"gettime":"2020年","name":"烧烤味木耳鸡蛋","authorname":"不安分的番茄","exclusive":0,"id":"264669350","isrec":"4","authorimageid":"264571698"}]
/// message : "获取成功！"

class RecipeDetailModel {
  String _state;
  List<DetailList> _list;
  String _message;

  String get state => _state;
  List<DetailList> get list => _list;
  String get message => _message;

  RecipeDetailModel({
      String state, 
      List<DetailList> list,
      String message}){
    _state = state;
    _list = list;
    _message = message;
}

  RecipeDetailModel.fromJson(dynamic json) {
    _state = json["state"];
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list.add(DetailList.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["state"] = _state;
    if (_list != null) {
      map["list"] = _list.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }

}

/// hasVideo : false
/// imageid : "264669352"
/// materialList : [{"dosage":"150g","contentid":"264669350","mwikipediaid":"","name":"泡发黑木耳","ordernum":0,"id":"6763273","version":0},{"dosage":"2个","contentid":"264669350","mwikipediaid":"","name":"鸡蛋","ordernum":1,"id":"6763274","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"孜然粉","ordernum":2,"id":"6763275","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"盐","ordernum":3,"id":"6763276","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"鸡精","ordernum":4,"id":"6763277","version":0},{"dosage":"适量","contentid":"264669350","mwikipediaid":"","name":"生抽","ordernum":5,"id":"6763278","version":0}]
/// description : ""
/// stepList : [{"imageid":"264669353","contentid":"264669350","details":"准备好泡发黑木耳","ordernum":0,"id":"9273679","time":0,"version":0},{"imageid":"264669355","contentid":"264669350","details":"如果木耳太大，可以改刀切一下","ordernum":1,"id":"9273680","time":0,"version":0},{"imageid":"264669356","contentid":"264669350","details":"鸡蛋打散，搅拌至冒泡备用","ordernum":2,"id":"9273681","time":0,"version":0},{"imageid":"264669357","contentid":"264669350","details":"开始烹饪\n热锅烧油，要比平时炒菜至少多放一倍的油，要不然鸡蛋扑不起来","ordernum":3,"id":"9273682","time":0,"version":0},{"imageid":"264669358","contentid":"264669350","details":"油烧热，开中火倒入鸡蛋","ordernum":4,"id":"9273683","time":0,"version":0},{"imageid":"264669359","contentid":"264669350","details":"两面煎至金黄撒少许盐翻炒","ordernum":5,"id":"9273684","time":0,"version":0},{"imageid":"264669361","contentid":"264669350","details":"用铲子将鸡蛋捣碎盛出备用","ordernum":6,"id":"9273685","time":0,"version":0},{"imageid":"264669363","contentid":"264669350","details":"锅中炒鸡蛋剩余的油炒木耳","ordernum":7,"id":"9273686","time":0,"version":0},{"imageid":"264669365","contentid":"264669350","details":"加入少许盐翻炒均匀","ordernum":8,"id":"9273687","time":0,"version":0},{"imageid":"264669368","contentid":"264669350","details":"倒入鸡蛋","ordernum":9,"id":"9273688","time":0,"version":0},{"imageid":"264669370","contentid":"264669350","details":"加水一丢丢(加水是为了避免木耳翻炒的时候有炸裂的声音)","ordernum":10,"id":"9273689","time":0,"version":0},{"imageid":"264669372","contentid":"264669350","details":"此时可以加入调料，十三香适量","ordernum":11,"id":"9273690","time":0,"version":0},{"imageid":"264669374","contentid":"264669350","details":"鸡精适量","ordernum":12,"id":"9273691","time":0,"version":0},{"imageid":"264669391","contentid":"264669350","details":"味极鲜或者生抽少许","ordernum":13,"id":"9273692","time":0,"version":0},{"imageid":"264669392","contentid":"264669350","details":"孜然粉比其他调料多1倍的量","ordernum":14,"id":"9273693","time":0,"version":0},{"imageid":"264669394","contentid":"264669350","details":"混合翻炒均匀即可出锅","ordernum":15,"id":"9273694","time":0,"version":0},{"imageid":"264669395","contentid":"264669350","details":"装盘上桌","ordernum":16,"id":"9273695","time":0,"version":0}]
/// video : null
/// authorid : "263505855"
/// version : "1"
/// url : null
/// tags : "家常菜,快手菜,素菜,鸡蛋"
/// tipList : [{"contentid":"264669350","details":"","ordernum":0,"id":"849842","version":0}]
/// gettime : "2020年"
/// name : "烧烤味木耳鸡蛋"
/// authorname : "不安分的番茄"
/// exclusive : 0
/// id : "264669350"
/// isrec : "4"
/// authorimageid : "264571698"

class DetailList {
  bool _hasVideo;
  String _imageid;
  List<MaterialList> _materialList;
  String _description;
  List<StepList> _stepList;
  dynamic _video;
  String _authorid;
  String _version;
  dynamic _url;
  String _tags;
  List<TipList> _tipList;
  String _gettime;
  String _name;
  String _authorname;
  int _exclusive;
  String _id;
  String _isrec;
  String _authorimageid;

  bool get hasVideo => _hasVideo;
  String get imageid => _imageid;
  List<MaterialList> get materialList => _materialList;
  String get description => _description;
  List<StepList> get stepList => _stepList;
  dynamic get video => _video;
  String get authorid => _authorid;
  String get version => _version;
  dynamic get url => _url;
  String get tags => _tags;
  List<TipList> get tipList => _tipList;
  String get gettime => _gettime;
  String get name => _name;
  String get authorname => _authorname;
  int get exclusive => _exclusive;
  String get id => _id;
  String get isrec => _isrec;
  String get authorimageid => _authorimageid;

  DetailList({
      bool hasVideo, 
      String imageid, 
      List<MaterialList> materialList, 
      String description, 
      List<StepList> stepList, 
      dynamic video, 
      String authorid, 
      String version, 
      dynamic url, 
      String tags, 
      List<TipList> tipList, 
      String gettime, 
      String name, 
      String authorname, 
      int exclusive, 
      String id, 
      String isrec, 
      String authorimageid}){
    _hasVideo = hasVideo;
    _imageid = imageid;
    _materialList = materialList;
    _description = description;
    _stepList = stepList;
    _video = video;
    _authorid = authorid;
    _version = version;
    _url = url;
    _tags = tags;
    _tipList = tipList;
    _gettime = gettime;
    _name = name;
    _authorname = authorname;
    _exclusive = exclusive;
    _id = id;
    _isrec = isrec;
    _authorimageid = authorimageid;
}

  DetailList.fromJson(dynamic json) {
    _hasVideo = json["hasVideo"];
    _imageid = json["imageid"];
    if (json["materialList"] != null) {
      _materialList = [];
      json["materialList"].forEach((v) {
        _materialList.add(MaterialList.fromJson(v));
      });
    }
    _description = json["description"];
    if (json["stepList"] != null) {
      _stepList = [];
      json["stepList"].forEach((v) {
        _stepList.add(StepList.fromJson(v));
      });
    }
    _video = json["video"];
    _authorid = json["authorid"];
    _version = json["version"];
    _url = json["url"];
    _tags = json["tags"];
    if (json["tipList"] != null) {
      _tipList = [];
      json["tipList"].forEach((v) {
        _tipList.add(TipList.fromJson(v));
      });
    }
    _gettime = json["gettime"];
    _name = json["name"];
    _authorname = json["authorname"];
    _exclusive = json["exclusive"];
    _id = json["id"];
    _isrec = json["isrec"];
    _authorimageid = json["authorimageid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["hasVideo"] = _hasVideo;
    map["imageid"] = _imageid;
    if (_materialList != null) {
      map["materialList"] = _materialList.map((v) => v.toJson()).toList();
    }
    map["description"] = _description;
    if (_stepList != null) {
      map["stepList"] = _stepList.map((v) => v.toJson()).toList();
    }
    map["video"] = _video;
    map["authorid"] = _authorid;
    map["version"] = _version;
    map["url"] = _url;
    map["tags"] = _tags;
    if (_tipList != null) {
      map["tipList"] = _tipList.map((v) => v.toJson()).toList();
    }
    map["gettime"] = _gettime;
    map["name"] = _name;
    map["authorname"] = _authorname;
    map["exclusive"] = _exclusive;
    map["id"] = _id;
    map["isrec"] = _isrec;
    map["authorimageid"] = _authorimageid;
    return map;
  }

}

/// contentid : "264669350"
/// details : ""
/// ordernum : 0
/// id : "849842"
/// version : 0

class TipList {
  String _contentid;
  String _details;
  int _ordernum;
  String _id;
  int _version;

  String get contentid => _contentid;
  String get details => _details;
  int get ordernum => _ordernum;
  String get id => _id;
  int get version => _version;

  TipList({
      String contentid, 
      String details, 
      int ordernum, 
      String id, 
      int version}){
    _contentid = contentid;
    _details = details;
    _ordernum = ordernum;
    _id = id;
    _version = version;
}

  TipList.fromJson(dynamic json) {
    _contentid = json["contentid"];
    _details = json["details"];
    _ordernum = json["ordernum"];
    _id = json["id"];
    _version = json["version"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["contentid"] = _contentid;
    map["details"] = _details;
    map["ordernum"] = _ordernum;
    map["id"] = _id;
    map["version"] = _version;
    return map;
  }

}

/// imageid : "264669353"
/// contentid : "264669350"
/// details : "准备好泡发黑木耳"
/// ordernum : 0
/// id : "9273679"
/// time : 0
/// version : 0

class StepList {
  String _imageid;
  String _contentid;
  String _details;
  int _ordernum;
  String _id;
  int _time;
  int _version;

  String get imageid => _imageid;
  String get contentid => _contentid;
  String get details => _details;
  int get ordernum => _ordernum;
  String get id => _id;
  int get time => _time;
  int get version => _version;

  StepList({
      String imageid, 
      String contentid, 
      String details, 
      int ordernum, 
      String id, 
      int time, 
      int version}){
    _imageid = imageid;
    _contentid = contentid;
    _details = details;
    _ordernum = ordernum;
    _id = id;
    _time = time;
    _version = version;
}

  StepList.fromJson(dynamic json) {
    _imageid = json["imageid"];
    _contentid = json["contentid"];
    _details = json["details"];
    _ordernum = json["ordernum"];
    _id = json["id"];
    _time = json["time"];
    _version = json["version"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imageid"] = _imageid;
    map["contentid"] = _contentid;
    map["details"] = _details;
    map["ordernum"] = _ordernum;
    map["id"] = _id;
    map["time"] = _time;
    map["version"] = _version;
    return map;
  }

}

/// dosage : "150g"
/// contentid : "264669350"
/// mwikipediaid : ""
/// name : "泡发黑木耳"
/// ordernum : 0
/// id : "6763273"
/// version : 0

class MaterialList {
  String _dosage;
  String _contentid;
  String _mwikipediaid;
  String _name;
  int _ordernum;
  String _id;
  int _version;

  String get dosage => _dosage;
  String get contentid => _contentid;
  String get mwikipediaid => _mwikipediaid;
  String get name => _name;
  int get ordernum => _ordernum;
  String get id => _id;
  int get version => _version;

  MaterialList({
      String dosage, 
      String contentid, 
      String mwikipediaid, 
      String name, 
      int ordernum, 
      String id, 
      int version}){
    _dosage = dosage;
    _contentid = contentid;
    _mwikipediaid = mwikipediaid;
    _name = name;
    _ordernum = ordernum;
    _id = id;
    _version = version;
}

  MaterialList.fromJson(dynamic json) {
    _dosage = json["dosage"];
    _contentid = json["contentid"];
    _mwikipediaid = json["mwikipediaid"];
    _name = json["name"];
    _ordernum = json["ordernum"];
    _id = json["id"];
    _version = json["version"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dosage"] = _dosage;
    map["contentid"] = _contentid;
    map["mwikipediaid"] = _mwikipediaid;
    map["name"] = _name;
    map["ordernum"] = _ordernum;
    map["id"] = _id;
    map["version"] = _version;
    return map;
  }

}