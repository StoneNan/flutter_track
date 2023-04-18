import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_track/other/ym_colors.dart';
import 'package:flutter_track/other/ym_fonts.dart';
import 'package:lottie/lottie.dart';

class YMLoading {
  /// 不带 Message
  static show({
    bool isWhite = false,
    bool lockScreen = true,
  }) {
    return _show(
      isWhite: isWhite,
      lockScreen: lockScreen,
    );
  }

  /// 带 Message
  static showWithMsg(
    String msg, {
    bool showBackground = true,
    bool lockScreen = true,
  }) {
    return _show(
      isWhite: true,
      message: msg,
      showBackground: showBackground,
      lockScreen: lockScreen,
    );
  }

  /// 隐藏
  static hide() {
    EasyLoading.dismiss();
  }

  /// 内部实现
  static _show({
    bool isWhite = false,
    bool lockScreen = true,
    bool showBackground = false,
    String? message,
  }) {
    var showBg = false;
    var icon = 'assets/lotties/loading.json';
    if (isWhite || message != null) {
      icon = 'assets/lotties/loading_white.json';
      if (showBackground) {
        showBg = true;
      }
    }
    EasyLoading.instance
      ..boxShadow = <BoxShadow>[]
      ..textColor = YMColors.textWhite
      ..userInteractions = !lockScreen
      ..textPadding = EdgeInsets.zero
      ..indicatorColor = Colors.transparent
      ..loadingStyle = EasyLoadingStyle.custom
      ..textStyle = showBg ? YMFonts.white12 : YMFonts.white14
      ..indicatorWidget = loadingIcon(icon: icon)
      ..contentPadding = const EdgeInsets.only(top: 0, bottom: 10, left: 16, right: 16)
      ..animationDuration = showBg ? const Duration(milliseconds: 200) : Duration.zero
      ..backgroundColor = showBg ? YMColors.black.withOpacity(0.8) : YMColors.transparent;
    EasyLoading.show(status: message);
  }

  static LottieBuilder loadingIcon({
    String icon = 'assets/lotties/loading.json',
    Animation<double>? controller,
    void Function(LottieComposition)? onLoaded,
  }) {
    return Lottie.asset(
      icon,
      width: 60,
      height: 60,
      controller: controller,
      onLoaded: onLoaded,
    );
  }
}
