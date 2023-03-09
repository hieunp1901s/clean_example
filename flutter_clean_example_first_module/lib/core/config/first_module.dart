import 'package:flutter_clean_example_core/common/app_module.dart';
import 'package:flutter_clean_example_core/main.dart';
import 'package:flutter_clean_example_first_module/core/config/first_module_page_route.dart';

class FirstModule extends AppModule {
  @override
  List<GetPage> createRoutes() => FirstModulePageRoute.createRoutes();
}