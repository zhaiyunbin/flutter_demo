
class Images{
  static String imagesTab = "assets/tab/";
  static String imagesHome = "assets/home/";
  //首页
  static String main = "tab_home";
  static String mainDef = "tab_home_def";
  static String zx = "tab_sc";
  static String zxDef= "tab_sc_def";
  static String collection = "tab_zx";
  static String collectionDef = "tab_zx_def";
  static String homeTest = "test";

  static String homeTopSearchIcon = "home_search";
  static String homeHeaderJs = "home_js";
  static String homeHeaderYy = "home_my";
  static String homeHeaderSs = "home_ss";
  static String getTabImagePath(String name, {String format: 'png'}) {
    return imagesTab+'$name.$format';
  }
  static String getHomeImagePath(String name, {String format: 'png'}) {
    return imagesHome+'$name.$format';
  }

}