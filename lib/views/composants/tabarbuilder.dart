import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/variables/themes.dart';

class TabbarBuilder extends StatefulWidget {
  const TabbarBuilder({super.key});

  @override
  State<TabbarBuilder> createState() => _TabbarBuilderState();
}

class _TabbarBuilderState extends State<TabbarBuilder>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  var styleobj = !Get.isDarkMode
      ? police.copyWith(
          color: Colors.grey.shade900,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0)
      : police.copyWith(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0);
  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: indigo,
      automaticIndicatorColorAdjustment: true,
      padding: const EdgeInsets.all(3),
      labelPadding: const EdgeInsets.all(8),
      unselectedLabelStyle: styleobj,
      physics: const BouncingScrollPhysics(),
      isScrollable: true,
      tabs: [
        Text("Traidings", style: styleobj),
        Text("My topic ", style: styleobj),
        Text("Local news", style: styleobj),
        Text("Fact check", style: styleobj),
        Text("Good news", style: styleobj),
      ],
    );
  }
}
