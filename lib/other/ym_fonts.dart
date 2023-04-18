import 'package:flutter/material.dart';
import 'package:flutter_track/other/app_locale.dart';
import 'package:flutter_track/other/ym_colors.dart';

/// App包含两种字体：mainFamily & subFamily
/// mainFamily 在中文环境中使用平台默认字体，在英文环境中使用'GT-Walsheim'；subFamily 固定为 'GT-Walsheim'
/// App包含两种字重：regular & bold
/// 英文环境下为 400 & 500；中文环境下汉字使用 400 & 600，英文数字使用 400 & 500
class YMFonts {
  /// family
  static String? get mainFamily => AppLocale().isEn ? 'GT-Walsheim' : null;
  static const String subFamily = 'GT-Walsheim';

  /// Blue
  static const TextStyle blue16 = TextStyle(color: YMColors.textBlue, fontSize: 16, fontWeight: FontWeight.w400, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle blue20 = TextStyle(color: YMColors.textBlue, fontSize: 20, fontWeight: FontWeight.w400, leadingDistribution: TextLeadingDistribution.even);
  static TextStyle blue16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? blue16.ym_w500 : blue16.ym_w600;
  static TextStyle blue20B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? blue20.ym_w500 : blue20.ym_w600;

  /// Black
  static const TextStyle black32 = TextStyle(color: YMColors.textBlack, fontSize: 32, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle black24 = TextStyle(color: YMColors.textBlack, fontSize: 24, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle black18 = TextStyle(color: YMColors.textBlack, fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle black16 = TextStyle(color: YMColors.textBlack, fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle black14 = TextStyle(color: YMColors.textBlack, fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle black12 = TextStyle(color: YMColors.textBlack, fontSize: 12, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle black10 = TextStyle(color: YMColors.textBlack, fontSize: 10, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static TextStyle black32B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black32.ym_w500 : black32.ym_w600;
  static TextStyle black24B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black24.ym_w500 : black24.ym_w600;
  static TextStyle black18B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black18.ym_w500 : black18.ym_w600;
  static TextStyle black16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black16.ym_w500 : black16.ym_w600;
  static TextStyle black14B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black14.ym_w500 : black14.ym_w600;
  static TextStyle black12B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black12.ym_w500 : black12.ym_w600;
  static TextStyle black10B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? black10.ym_w500 : black10.ym_w600;

  /// Red
  static const TextStyle red32 = TextStyle(color: YMColors.textRed, fontSize: 32, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red24 = TextStyle(color: YMColors.textRed, fontSize: 24, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red20 = TextStyle(color: YMColors.textRed, fontSize: 20, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red18 = TextStyle(color: YMColors.textRed, fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red16 = TextStyle(color: YMColors.textRed, fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red14 = TextStyle(color: YMColors.textRed, fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red12 = TextStyle(color: YMColors.textRed, fontSize: 12, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle red10 = TextStyle(color: YMColors.textRed, fontSize: 10, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static TextStyle red32B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red32.ym_w500 : red32.ym_w600;
  static TextStyle red24B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red24.ym_w500 : red24.ym_w600;
  static TextStyle red18B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red18.ym_w500 : red18.ym_w600;
  static TextStyle red16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red16.ym_w500 : red16.ym_w600;
  static TextStyle red14B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red14.ym_w500 : red14.ym_w600;
  static TextStyle red12B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red12.ym_w500 : red12.ym_w600;
  static TextStyle red10B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? red10.ym_w500 : red10.ym_w600;

  /// White
  static const TextStyle white32 = TextStyle(color: YMColors.textWhite, fontSize: 32, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle white24 = TextStyle(color: YMColors.textWhite, fontSize: 24, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle white18 = TextStyle(color: YMColors.textWhite, fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle white16 = TextStyle(color: YMColors.textWhite, fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle white14 = TextStyle(color: YMColors.textWhite, fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle white12 = TextStyle(color: YMColors.textWhite, fontSize: 12, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static const TextStyle white10 = TextStyle(color: YMColors.textWhite, fontSize: 10, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);
  static TextStyle white32B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white32.ym_w500 : white32.ym_w600;
  static TextStyle white24B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white24.ym_w500 : white24.ym_w600;
  static TextStyle white18B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white18.ym_w500 : white18.ym_w600;
  static TextStyle white16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white16.ym_w500 : white16.ym_w600;
  static TextStyle white14B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white14.ym_w500 : white14.ym_w600;
  static TextStyle white12B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white12.ym_w500 : white12.ym_w600;
  static TextStyle white10B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? white10.ym_w500 : white10.ym_w600;

  // Grey
  /// #666666
  static const TextStyle grey32 = TextStyle(color: YMColors.textGrey, fontSize: 32, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static const TextStyle grey24 = TextStyle(color: YMColors.textGrey, fontSize: 24, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static const TextStyle grey18 = TextStyle(color: YMColors.textGrey, fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static const TextStyle grey16 = TextStyle(color: YMColors.textGrey, fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static const TextStyle grey14 = TextStyle(color: YMColors.textGrey, fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static const TextStyle grey12 = TextStyle(color: YMColors.textGrey, fontSize: 12, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static const TextStyle grey10 = TextStyle(color: YMColors.textGrey, fontSize: 10, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #666666
  static TextStyle grey32B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey32.ym_w500 : grey32.ym_w600;

  /// #666666
  static TextStyle grey24B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey24.ym_w500 : grey24.ym_w600;

  /// #666666
  static TextStyle grey18B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey18.ym_w500 : grey18.ym_w600;

  /// #666666
  static TextStyle grey16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey16.ym_w500 : grey16.ym_w600;

  /// #666666
  static TextStyle grey14B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey14.ym_w500 : grey14.ym_w600;

  /// #666666
  static TextStyle grey12B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey12.ym_w500 : grey12.ym_w600;

  /// #666666
  static TextStyle grey10B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? grey10.ym_w500 : grey10.ym_w600;

  // Grey Light
  /// #999999
  static const TextStyle greyLight32 = TextStyle(color: YMColors.textGreyLight, fontSize: 32, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight24 = TextStyle(color: YMColors.textGreyLight, fontSize: 24, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight20 = TextStyle(color: YMColors.textGreyLight, fontSize: 20, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight18 = TextStyle(color: YMColors.textGreyLight, fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight16 = TextStyle(color: YMColors.textGreyLight, fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight14 = TextStyle(color: YMColors.textGreyLight, fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight12 = TextStyle(color: YMColors.textGreyLight, fontSize: 12, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static const TextStyle greyLight10 = TextStyle(color: YMColors.textGreyLight, fontSize: 10, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #999999
  static TextStyle greyLight32B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight32.ym_w500 : greyLight32.ym_w600;

  /// #999999
  static TextStyle greyLight24B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight24.ym_w500 : greyLight24.ym_w600;

  /// #999999
  static TextStyle greyLight18B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight18.ym_w500 : greyLight18.ym_w600;

  /// #999999
  static TextStyle greyLight16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight16.ym_w500 : greyLight16.ym_w600;

  /// #999999
  static TextStyle greyLight14B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight14.ym_w500 : greyLight14.ym_w600;

  /// #999999
  static TextStyle greyLight12B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight12.ym_w500 : greyLight12.ym_w600;

  /// #999999
  static TextStyle greyLight10B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyLight10.ym_w500 : greyLight10.ym_w600;

  // Grey Disabled
  /// #cccccc
  static const TextStyle greyDisabled32 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 32, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static const TextStyle greyDisabled24 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 24, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static const TextStyle greyDisabled18 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 18, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static const TextStyle greyDisabled16 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static const TextStyle greyDisabled14 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static const TextStyle greyDisabled12 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 12, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static const TextStyle greyDisabled10 = TextStyle(color: YMColors.textGreyDisabled, fontSize: 10, fontWeight: FontWeight.w400, height: 1.6, leadingDistribution: TextLeadingDistribution.even);

  /// #cccccc
  static TextStyle greyDisabled32B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled32.ym_w500 : greyDisabled32.ym_w600;

  /// #cccccc
  static TextStyle greyDisabled24B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled24.ym_w500 : greyDisabled24.ym_w600;

  /// #cccccc
  static TextStyle greyDisabled18B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled18.ym_w500 : greyDisabled18.ym_w600;

  /// #cccccc
  static TextStyle greyDisabled16B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled16.ym_w500 : greyDisabled16.ym_w600;

  /// #cccccc
  static TextStyle greyDisabled14B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled14.ym_w500 : greyDisabled14.ym_w600;

  /// #cccccc
  static TextStyle greyDisabled12B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled12.ym_w500 : greyDisabled12.ym_w600;

  /// #cccccc
  static TextStyle greyDisabled10B({bool isForceW500 = false}) => (AppLocale().isEn || isForceW500) ? greyDisabled10.ym_w500 : greyDisabled10.ym_w600;
}

// ignore_for_file: non_constant_identifier_names

extension TextStyleExtension on TextStyle {
  /// fontFamily
  TextStyle get ym_subFamily => copyWith(fontFamily: YMFonts.subFamily);

  /// lineHeight
  TextStyle get ym_h1 => copyWith(height: 1);
  TextStyle get ym_h13 => copyWith(height: 1.3);
  TextStyle get ym_h15 => copyWith(height: 1.5);

  /// fontWeight
  TextStyle get ym_w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get ym_w600 => copyWith(fontWeight: FontWeight.w600);

  /// underline
  TextStyle get ym_underline => copyWith(decoration: TextDecoration.underline);

  /// lineThrough
  TextStyle get ym_lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}
