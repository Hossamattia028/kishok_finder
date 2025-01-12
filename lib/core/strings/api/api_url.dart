// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApiUrl {
  static Map<String,String> headerAuth =  {
    'Content-Type': 'application/json',
  };

  //production
  static const String MAIN_DOMAIN = '';
  static const String VERSION = 'v1.0';


  static const String BASE_URL = '$MAIN_DOMAIN/api/';
  static const String STORAGE_URL = '$MAIN_DOMAIN/public/';
  

}
