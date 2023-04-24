import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 控制曝光
class YMExposureWrapper extends StatefulWidget {
  const YMExposureWrapper(
    this.scrollNotificationController, {
    required this.child,
    required this.onExpose,
    this.exposeFactor = 0.8,
    this.onHide,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double exposeFactor;
  final VoidCallback onExpose;
  final Function(Duration duration)? onHide;
  final StreamController<ScrollNotification?> scrollNotificationController;

  @override
  State<YMExposureWrapper> createState() => _YMExposureWrapperState();
}

class _YMExposureWrapperState extends State<YMExposureWrapper> {
  bool _isVisible = false;
  DateTime? _exposeDate;
  double _scrollOffset = 0.0;
  StreamSubscription? _scrollNotificationSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _subscribeScrollNotification(context));
  }

  @override
  void dispose() {
    _scrollNotificationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _subscribeScrollNotification(BuildContext context) {
    if (mounted) {
      _scrollNotificationSubscription?.cancel();
      _scrollNotificationSubscription = widget.scrollNotificationController.stream.listen(
        (scrollNotification) {
          final sn = _getScrollNotification(scrollNotification);
          _scrollOffset = sn.metrics.pixels;
          if (scrollNotification == null || _scrollOffset > 0) {
            _onTrackWidgetPosition();
          }
        },
      );
    }
  }

  void _onTrackWidgetPosition() {
    if (mounted) {
      final exposureOffset = _getExposureOffset();
      final exposurePitSize = _getExposurePitSize();
      final viewPortSize = _getViewPortSize() ?? const Size(1, 1);
      _onCheckExposure(exposureOffset, _scrollOffset, exposurePitSize.height, viewPortSize.height);
    }
  }

  void _onCheckExposure(double exposureOffset, double scrollOffset, double currentSize, double viewPortSize) {
    final exposeFactor = min(max(widget.exposeFactor, 0.1), 1);
    if (!_isVisible) {
      bool becomeVisible = (exposureOffset + currentSize * (1 - exposeFactor)) > scrollOffset && (exposureOffset + currentSize * exposeFactor) < (scrollOffset + viewPortSize);
      if (becomeVisible) {
        _onExpose();
      }
    } else {
      bool becomeInvisible = (exposureOffset + currentSize * exposeFactor) < scrollOffset || (exposureOffset + (currentSize * (exposeFactor))) > scrollOffset + viewPortSize;
      if (becomeInvisible) {
        _onHide();
      }
    }
  }

  _onExpose() {
    _isVisible = true;
    widget.onExpose.call();
    _exposeDate = DateTime.now();
  }

  _onHide() {
    _isVisible = false;
    widget.onHide?.call(DateTime.now().difference(_exposeDate!));
  }
}

extension _YMExposureWrapperStateExtension on _YMExposureWrapperState {
  /// scrollNotification == null 表示页面初始化/刷新后，没有滚动时手动发的 fake 通知
  /// 此时虽然没真实滚动，但需要曝光屏幕内的组件
  ScrollNotification _getScrollNotification(ScrollNotification? scrollNotification) {
    if (scrollNotification != null) {
      return scrollNotification;
    } else {
      _isVisible = false;
      return ScrollStartNotification(
        context: context,
        metrics: FixedScrollMetrics(
          pixels: 0.0,
          minScrollExtent: 0.0,
          maxScrollExtent: 0.0,
          viewportDimension: 0.0,
          axisDirection: AxisDirection.down,
        ),
      );
    }
  }

  Size _getExposurePitSize() {
    var renderObject = context.findRenderObject();
    if (renderObject is RenderBox) {
      return renderObject.size;
    } else {
      return Size.zero;
    }
  }

  Size? _getViewPortSize() {
    final RenderAbstractViewport? viewport = RenderAbstractViewport.of(context.findRenderObject());
    final Size? size = viewport?.paintBounds.size;
    return size;
  }

  double _getExposureOffset() {
    final RenderObject? box = context.findRenderObject();
    final RenderAbstractViewport? viewport = RenderAbstractViewport.of(box);

    if (viewport == null || box == null || !box.attached) {
      return 0.0;
    }

    final RevealedOffset offsetRevealToTop = viewport.getOffsetToReveal(box, 0.0, rect: Rect.zero);
    return offsetRevealToTop.offset;
  }
}
