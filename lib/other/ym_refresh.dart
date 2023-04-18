import 'package:flutter/cupertino.dart';
import 'package:flutter_track/other/ym_colors.dart';
import 'package:flutter_track/other/ym_fonts.dart';
import 'package:flutter_track/other/ym_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// child 为列表 widget
/// initialRefresh 表示是否在界面初始化后自动下拉刷新
/// onRefresh 下拉刷新回调，传 null 时禁用下拉刷新，刷新成功返回 true，失败返回 false
/// onLoading 上拉加载更多回调，传 null 时禁用上拉，刷新成功返回 true，失败返回 false，no more data 返回 null
class YMRefresh extends StatefulWidget {
  final Widget child;
  final bool initialRefresh;

  /// onRefresh 下拉刷新回调，传 null 时禁用下拉刷新，刷新成功返回 true，失败返回 false
  final Future<bool> Function()? onRefresh;

  /// onLoading 上拉加载更多回调，传 null 时禁用上拉，刷新成功返回 true，失败返回 false，no more data 返回 null
  final Future<bool?> Function()? onLoading;

  const YMRefresh({
    required this.child,
    this.initialRefresh = false,
    this.onRefresh,
    this.onLoading,
    Key? key,
  }) : super(key: key);

  @override
  State<YMRefresh> createState() => _YMRefreshState();
}

class _YMRefreshState extends State<YMRefresh> with TickerProviderStateMixin {
  late final RefreshController _refreshController;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: widget.initialRefresh);
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  _onRefresh() {
    widget.onRefresh?.call().then((success) {
      if (success) {
        _refreshController.refreshCompleted();
      } else {
        _refreshController.refreshFailed();
      }
      _refreshController.resetNoData();
    });
  }

  _onLoading() {
    widget.onLoading?.call().then((success) {
      if (success == null) {
        _refreshController.loadNoData();
      } else {
        if (success) {
          _refreshController.loadComplete();
        } else {
          _refreshController.loadFailed();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: _header(),
      footer: _footer(),
      onLoading: () => _onLoading(),
      onRefresh: () => _onRefresh(),
      controller: _refreshController,
      enablePullUp: widget.onLoading != null,
      enablePullDown: widget.onRefresh != null,
      child: widget.child,
    );
  }

  Widget _header() {
    return CustomHeader(
      refreshStyle: RefreshStyle.Behind,
      readyToRefresh: () {
        _animationController.repeat();
        return Future.value(null);
      },
      endRefresh: () {
        _animationController.stop();
        _animationController.reset();
        return Future.value(null);
      },
      builder: (context, refreshStatus) {
        return Center(
          child: YMLoading.loadingIcon(
            controller: _animationController,
            onLoaded: (lottie) => _animationController.duration = lottie.duration,
          ),
        );
      },
    );
  }

  Widget _footer() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = const SizedBox();
        } else if (mode == LoadStatus.loading) {
          body = Center(child: YMLoading.loadingIcon());
        } else if (mode == LoadStatus.failed) {
          body = const SizedBox();
        } else if (mode == LoadStatus.canLoading) {
          body = const SizedBox();
        } else {
          body = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(color: YMColors.borderGrey, height: 1, width: 24),
              const SizedBox(width: 8),
              const Text('End', style: YMFonts.greyDisabled12),
              const SizedBox(width: 8),
              Container(color: YMColors.borderGrey, height: 1, width: 24),
            ],
          );
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
