enum Environment { dev, pro }

class AppEnvironment {
  static Environment _env = Environment.pro;
  static Map<String, dynamic> _config = {};

  AppEnvironment._();

  static void setEnvironment(Environment env) {
    _env = env;

    switch (env) {
      case Environment.dev:
        _config = {
          'baseUrl': 'https://dummyjson.com',
          'apiVersion': '',
          'apiPrefix': ''
        };
        break;
      case Environment.pro:
        _config = {
          'baseUrl': 'https://dummyjson.com',
          'apiVersion': '',
          'apiPrefix': ''
        };
        break;
    }
  }

  static Environment get environment => _env;
  static Map<String, dynamic> get config => _config;
  static String get baseUrl => _config['baseUrl'];
  static String get apiVersion => _config['apiVersion'];
  static String get apiPrefix => _config['apiPrefix'];

}