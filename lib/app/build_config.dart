const String DEV_TITLE = "Repose Dev";
const String PROD_TITLE = "Repose";

//const String DEV_URL = "http://192.168.0.132:8012/api/v1";
const String DEV_URL = "http://dev.reposeplus.netrin.tech/api//v1";
const String PROD_URL = "http://dev.reposeplus.netrin.tech/api/v1";

const String DEV_WEBSITE_URL = "http://dev.reposeplus.netrin.tech/api/v1";
const String PROD_WEBSITE_URL = "http://dev.reposeplus.netrin.tech/api/v1";

enum BUILD_TYPE {
  DEV,
  PROD,
}

class Config {
  static BUILD_TYPE buildType = BUILD_TYPE.PROD;

  static init() async {}

  static initLog() {}

  static String get appTitle {
    switch (buildType) {
      case BUILD_TYPE.DEV:
        return DEV_TITLE;
      case BUILD_TYPE.PROD:
        return PROD_TITLE;
      default:
        return PROD_TITLE;
    }
  }

  static String get baseUrl {
    switch (buildType) {
      case BUILD_TYPE.DEV:
        return DEV_URL;
      case BUILD_TYPE.PROD:
        return PROD_URL;
      default:
        return PROD_URL;
    }
  }

  static String get baseWebUrl {
    switch (buildType) {
      case BUILD_TYPE.DEV:
        return DEV_WEBSITE_URL;
      case BUILD_TYPE.PROD:
        return PROD_WEBSITE_URL;
      default:
        return PROD_WEBSITE_URL;
    }
  }

  static String get environment {
    switch (buildType) {
      case BUILD_TYPE.DEV:
        return "dev";
      case BUILD_TYPE.PROD:
        return "prod";
      default:
        return "prod";
    }
  }
}
