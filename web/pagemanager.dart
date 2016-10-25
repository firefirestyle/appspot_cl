part of firestylesite;
//
//
//
class PageManager {
  static String title = "title";
  static String message = "message";
  static String backurl = "backurl";
  static String userNameId = "userName";
  static PageManager instance = new PageManager();
  void jumpToMePage() {
    loc.Location l = new loc.Location();
    html.window.location.assign(l.baseAddr + "/#/Me");
  }

  String getUrlUserPage(String userName) {
    loc.Location l = new loc.Location();
    return l.baseAddr + "/#/User?${userNameId}=${Uri.encodeComponent(userName)}";
  }
  void jumpToUserPage(String userName) {
    html.window.location.assign(getUrlUserPage(userName));
  }

  void jumpToErrorPage(String title, String message, String backurl) {
    loc.Location l = new loc.Location();
    html.window.location.assign(l.baseAddr + "/#/Error?title=${Uri.encodeComponent(title)}&message=${Uri.encodeComponent(message)}&backurl=${Uri.encodeComponent(backurl)}");
  }

  List<String> getErrorPageRequest(loc.Location location) {
    return [location.getValueAsString(title, ""), location.getValueAsString(message, ""), location.getValueAsString(backurl, "")];
  }

  List<String> getUserNamePageRequest(loc.Location location) {
    return [location.getValueAsString(userNameId, "")];
  }
}