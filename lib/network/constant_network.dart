abstract class ConstantNetwork {
  

  static String baseUrl = 'https://api.escuelajs.co/api/v1/';

  static Map<String, String> header(TypeToken token) {
    Map<String, String> headers = {};
    if (token == TypeToken.contentType) {
      headers = {
        // 'Content-Type': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
    } else if (token == TypeToken.authorization) {
      headers = {
        // 'Authorization': 'Bearer ${SharedPref.instance.getUserData().token}',
        //'Accept-Language': SharedPref.instance.getUserLanguage()
      };
    } else if (token == TypeToken.authorizationContentType) {
      headers = {
        // 'Authorization': 'Bearer ${SharedPref.instance.getUserData().token}',
        'Content-Type': 'application/json',
      };
    } else if (token == TypeToken.acceptLanguage) {
      headers = {
        //'Accept-Language': SharedPref.instance.getUserLanguage(),
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    return headers;
  }
  
}

enum TypeToken {
  //todo this for application/json
  contentType,
  //todo this for Authorization Bearer
  authorization,
  //todo this for Authorization Bearer &&  Content_Type
  authorizationContentType,
  //
  acceptLanguage
}

