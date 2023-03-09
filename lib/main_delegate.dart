import 'package:flutter/material.dart';
import 'package:flutter_clean_example_core/common/app_env.dart';
import 'package:flutter_clean_example_core/common/app_module.dart';
import 'package:flutter_clean_example_core/lang/localization_service.dart';
import 'package:flutter_clean_example_core/main.dart';
import 'package:flutter_clean_example_first_module/core/config/first_module.dart';
import 'package:flutter_clean_example_first_module/core/config/first_module_page_route.dart';

void mainDelegate(Environment appEnvironment) async {
  WidgetsFlutterBinding.ensureInitialized();

  final pages = initAppModule();

  AppEnvironment.setEnvironment(appEnvironment);
  initService();
  initLocalStorage();
  initFirebase();
  await initLocalization();

  runApp(App(pages: pages));
}

List<GetPage> initAppModule() {
  final modules = <AppModule>[];
  final pages = <GetPage>[];

  modules.add(FirstModule());

  for (var module in modules) {
    pages.addAll(module.createRoutes());
  }

  return pages;
}

void initService() {}

void initLocalStorage() {}

void initFirebase() {}

Future<void> initLocalization() async => LocalizationService.loadLanguage();

class App extends StatelessWidget {
  const App({Key? key, required this.pages}) : super(key: key);
  final List<GetPage> pages;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //init page route
      initialRoute: FirstModulePageRoute.firstPage,
      getPages: pages,
      //init localize
      translations: LocalizationService(),
      locale: LocalizationService.currentLocale,
      fallbackLocale: LocalizationService.fallbackLocale,
    );
  }
}
