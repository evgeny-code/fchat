
import 'package:flutter/material.dart';

class ControllerRegistry {
  static final ControllerRegistry _singleton = ControllerRegistry._internal();

  factory ControllerRegistry() {
    return _singleton;
  }

  ControllerRegistry._internal();

  late TabController tabController;
  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();


}