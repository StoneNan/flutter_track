import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_track/other/ym_fonts.dart';
import 'package:flutter_track/other/ym_loading.dart';
import 'package:flutter_track/other/ym_refresh.dart';
import 'package:flutter_track/ym_exposure/ym_scroll_exposure_manager.dart';

enum SectionType {
  red,
  blue,
  grey,
  green,
  black,
  purple,
  lastList;

  String get key {
    switch (this) {
      case red:
        return '红 色';
      case blue:
        return '蓝 色';
      case grey:
        return '灰 色';
      case green:
        return '绿 色';
      case black:
        return '黑 色';
      case purple:
        return '紫 色';
      case lastList:
        return '最后的列表';
    }
  }

  Color get color {
    switch (this) {
      case red:
        return Colors.red;
      case blue:
        return Colors.blue;
      case grey:
        return Colors.grey;
      case green:
        return Colors.green;
      case black:
        return Colors.black;
      case purple:
        return Colors.purple;
      case lastList:
        return Colors.deepOrange;
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<SectionType> _initData = [
    SectionType.red,
    SectionType.blue,
    SectionType.grey,
    SectionType.green,
    SectionType.black,
    SectionType.purple,
    SectionType.lastList,
  ];

  final List<SectionType> _data = [];
  int _verticalListCount = 0;

  Set<String> get _dataKeys => _data.map((e) => e.key).toSet();

  late YMScrollExposureManager _exposureManager;

  @override
  void initState() {
    super.initState();
    _exposureManager = YMScrollExposureManager(_dataKeys);
    _loadData();
  }

  void _loadData() {
    YMLoading.show();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      YMLoading.hide();
      _data.addAll(_initData);
      _verticalListCount = 10;
      _exposureManager.resetSections(_dataKeys);
      setState(() {});
    });
  }

  Future<bool> _onLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    _verticalListCount += 10;
    setState(() {});
    return true;
  }

  Future<bool> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_data.length > 2) {
      _data.removeAt(0);
    } else {
      _data.clear();
      _data.addAll(_initData);
    }
    _verticalListCount = 10;
    _exposureManager.resetSections(_dataKeys);
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('曝光埋点'),
      ),
      body: _exposureManager.scrollViewWraper(
        child: YMRefresh(
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return CustomScrollView(
      slivers: _data.mapIndexed((index, e) {
        switch (e) {
          case SectionType.lastList:
            return _verticalList();
          default:
            return SliverToBoxAdapter(child: _horizontalList(e, index));
        }
      }).toList(),
    );
  }

  Widget _verticalList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _exposureManager.exposuredWraper(
              SectionType.lastList.key,
              index: index,
              child: Container(
                height: 200,
                alignment: Alignment.center,
                color: SectionType.lastList.color,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(index.toString(), style: YMFonts.white32B()),
              ),
            ),
          );
        },
        addRepaintBoundaries: true,
        addAutomaticKeepAlives: true,
        childCount: _verticalListCount,
      ),
    );
  }

  Widget _horizontalList(SectionType section, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: _exposureManager.exposuredWraper(
        section.key,
        index: 0,
        child: SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  color: section.color,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(index.toString(), style: YMFonts.white32B()),
                );
              }),
        ),
      ),
    );
  }
}
