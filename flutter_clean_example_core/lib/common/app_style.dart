import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppStyle {
  static double fontSizeMin = 10.0.sp;
  static double fontSizeName = 22.0.sp;
  static double fontSizeXS = 12.0.sp;
  static double fontSizeSM = 14.0.sp;
  static double fontSizeBase = 16.0.sp;
  static double fontSizeL = 18.0.sp;
  static double fontSizeXL = 20.0.sp;
  static double fontSize2XL = 24.0.sp;
  static double fontSize3XL = 30.0.sp;
  static double fontSize4XL = 36.0.sp;

  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeightRegular = FontWeight.w400;

  static TextStyle styleTextHeader = TextStyle(
      fontSize: fontSize2XL,
      fontWeight: fontWeightSemiBold,
      color: AppColor.colorAppPrimary,
  );

  AppStyle._internal();
}
