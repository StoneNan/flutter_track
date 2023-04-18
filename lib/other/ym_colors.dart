// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class YMColors {
  // Main Colors
  // 主要颜色包含红色、黑色、白色，分别为品牌色、背景颜色，主要操作按钮等颜色
  /// #ff0000
  static const Color red = Color(0xffFF0000);

  /// #000000
  static const Color black = Color(0xff000000);

  /// #ffffff
  static const Color white = Color(0xffffffff);

  /// Colors.transparent
  static const Color transparent = Colors.transparent;

  // Grey Colors
  // 包含一系列灰度颜色，用于文字颜色、分割线颜色等
  static const Color grey_22 = Color(0xff222222);
  static const Color grey_66 = Color(0xff666666);
  static const Color grey_99 = Color(0xff999999);
  static const Color grey_CC = Color(0xffcccccc);
  static const Color grey_EB = Color(0xffebebeb);
  static const Color grey_F5 = Color(0xfff5f5f5);

  // Background Color
  /// #ffffff
  static const Color background = white;

  // Text Colors
  // 主要用于文本和icon
  /// #ff0000
  static const Color textRed = red;

  /// #007AFF
  static const Color textBlue = Color(0xff007AFF);

  /// #ffffff
  static const Color textWhite = white;

  /// #222222
  static const Color textBlack = grey_22;

  /// #666666
  static const Color textGrey = grey_66;

  /// #999999
  static const Color textGreyLight = grey_99;

  /// #cccccc
  static const Color textGreyDisabled = grey_CC;

  // Icon Colors
  // 主要用于文本和icon
  /// #ff0000
  static const Color iconRed = red;

  /// #ffffff
  static const Color iconWhite = white;

  /// #222222
  static const Color iconBlack = grey_22;

  /// #666666
  static const Color iconGrey = grey_66;

  /// #ebebeb
  static const Color iconGreyUnfocus = grey_EB;

  /// #999999
  static const Color iconGreyLight = grey_99;

  /// #cccccc
  static const Color iconGreyDisabled = grey_CC;

  // Border Colors
  // 主要用边框、分割线颜色
  /// #ff0000
  static const Color borderRed = red;

  /// #222222
  static const Color borderBlack = grey_22;

  /// #ebebeb
  static const Color borderGrey = grey_EB;

  /// #f5f5f5
  static const Color borderGreyLight = grey_F5;

  // Fill Colors
  // 主要用于背景填充，按钮填充颜色
  /// #ff0000
  static const Color fillRed = red;

  /// #ffffff
  static const Color fillWhite = white;

  /// #222222
  static const Color fillBlack = grey_22;

  /// #cccccc
  static const Color fillGrey = grey_CC;

  /// #f5f5f5
  static const Color fillGreyLight = grey_F5;

  ///阴影色
  static const Color shadowColor = Color(0x1f000000);
}
