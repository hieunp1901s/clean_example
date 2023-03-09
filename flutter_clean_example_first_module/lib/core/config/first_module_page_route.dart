import 'package:flutter_clean_example_core/main.dart';
import 'package:flutter_clean_example_first_module/data/repository/login_repository_impl.dart';
import 'package:flutter_clean_example_first_module/domain/use_case/user_login_use_case.dart';
import '../../ui/page/first/first_page.dart';
import '../../ui/page/first/first_page_controller.dart';
import '../../ui/page/home/home_page.dart';
import '../../ui/page/second/second_page.dart';

class FirstModulePageRoute {
  static const root = '/first_module';
  static const firstPage = '$root/first_page';
  static const secondPage = '$root/second_page';

  FirstModulePageRoute._();

  static List<GetPage> createRoutes() {
    return [
      GetPage(
          name: root,
          page: () => const MyHomePage(title: ''),
          binding: BindingsBuilder(() {

          }),

      ),
      GetPage(
          name: firstPage,
          page: () => const FirstPage(),
          binding: BindingsBuilder(() {
            //luôn luôn đẩy impl
            Get.lazyPut(() => LoginRepositoryImpl());
            // Get.lazyPut(() => LoginRepositoryImplV2());
            Get.lazyPut(() => UserLoginUseCaseImpl(Get.find<LoginRepositoryImpl>()));
            // Get.lazyPut(() => UserLoginUseCaseImplV2(Get.find()));
            Get.lazyPut(() => FirstPageController(Get.find<UserLoginUseCaseImpl>()));
          }),

      ),
      GetPage(
          name: secondPage,
          page: () => const SecondPage(),
          binding: BindingsBuilder(() {

          }),
      ),

    ];
  }
}