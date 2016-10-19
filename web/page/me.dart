part of firestylesite;

class MePage extends loc.Page {
  String rootID;
  bool isExclusive;

  MePage({this.rootID: "fire-mepage", this.isExclusive: true}) {}

  bool updateLocation(loc.PageManager manager, loc.Location location) {
    if (location.hash.startsWith("#/Me")) {
      if (Cookie.instance.isLogin) {
        PageManager.instance.jumpToUserPage(Cookie.instance.userName);
      } else {
        manager.doEvent(loc.PageManagerEvent.startLoading);
        drawHtml()
            .then((v) {
              manager.doEvent(loc.PageManagerEvent.stopLoading);
            })
            .catchError((e) {})
            .whenComplete(() {
              manager.doEvent(loc.PageManagerEvent.stopLoading);
            });
      }
    } else {
      var rootElm = html.document.body.querySelector("#${rootID}");
      rootElm.style.display = "none";
    }
    return true;
  }

  bool updateEvent(loc.PageManager manager, loc.PageManagerEvent event) {
    return true;
  }

  Future drawHtml() async {
    var rootElm = html.document.body.querySelector("#${rootID}");
    rootElm.style.display = "block";
    rootElm.children.clear();
    rootElm.appendHtml(["""<a class="fire-mepage-login-item" href="${GetLoginNBox().makeLoginTwitterUrl()}"> twitter login </a>""",].join(), treeSanitizer: html.NodeTreeSanitizer.trusted);
  }
}