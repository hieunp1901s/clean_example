import 'package:flutter/material.dart';
import 'package:flutter_clean_example_core/lang/localization_service.dart';
import 'package:flutter_clean_example_core/main.dart';
import 'first_page_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FirstPageController>();
    return Scaffold(
      body: Center(child: Text('app_name'.tr)),
      floatingActionButton: GestureDetector(
        onTap: () {
          controller.login();
          var currentLanguage = LocalizationService.currentLanguage;
          if (currentLanguage == LanguageEnum.vietnamese) {
            currentLanguage = LanguageEnum.english;
          } else {
            currentLanguage = LanguageEnum.vietnamese;
          }
          LocalizationService.changeLocale(currentLanguage);
        },
        child: Container(
          color: Colors.red,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
