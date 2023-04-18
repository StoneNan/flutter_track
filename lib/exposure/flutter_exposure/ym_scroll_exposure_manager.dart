import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_track/exposure/flutter_exposure/ym_exposure_wrapper.dart';

class YMScrollExposureManager {
  /// _db =【sectionKey : exposuredIndexSet】
  final Map<String, Set<int>> _db = {};

  late final StreamController<ScrollNotification?> _scrollNotificationController;

  bool _needPostStartPosition = true;

  YMScrollExposureManager(Set<String> sections) {
    _scrollNotificationController = StreamController<ScrollNotification?>.broadcast();
    _needPostStartPosition = true;
    _addSections(sections);
  }

  void resetSections(Set<String> sections) {
    _db.clear();
    _addSections(sections);
    _needPostStartPosition = true;
  }

  void _addSections(Set<String> sections) {
    for (var section in sections) {
      if (section.isNotEmpty && !_db.containsKey(section)) {
        _db[section] = <int>{};
      }
    }
  }
}

extension YMScrollExposureManagerWidgetExtension on YMScrollExposureManager {
  Widget exposuredWraper(
    String section, {
    required Widget child,
    required int index,
  }) {
    return YMExposureWrapper(
      _scrollNotificationController,
      onExpose: () => onExpose(section, index),
      exposeFactor: 0.8,
      child: child,
    );
  }

  Widget scrollViewWraper({required Widget child, Key? key}) {
    return Builder(
      builder: (context) {
        if (_needPostStartPosition) {
          _needPostStartPosition = false;

          /// 首次展现需要单独发一个 pixels 为 0 的 Notification
          /// 为了避免 listener 还没有监听上从而丢失第一次消息，延迟 500 ms
          Future.delayed(const Duration(microseconds: 500)).then((_) {
            _scrollNotificationController.add(null);
          });
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) => _postNotification(scrollNotification),
          child: child,
        );
      },
    );
  }

  bool _postNotification(ScrollNotification notification) {
    if (notification.metrics.axis == Axis.vertical) {
      _scrollNotificationController.add(notification);
    }
    return false;
  }

  void onExpose(String section, int index) {
    if (_db.containsKey(section)) {
      if (!(_db[section] ?? {}).contains(index)) {
        (_db[section] ?? {}).add(index);
        debugPrint('✅✅✅ $section - $index');
      }
    }
  }
}
