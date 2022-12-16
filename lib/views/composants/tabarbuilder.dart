import 'package:flutter/material.dart';
import 'package:test/variables/themes.dart';

class TabbarBuilder extends StatefulWidget {
  const TabbarBuilder({super.key});

  @override
  State<TabbarBuilder> createState() => _TabbarBuilderState();
}

class _TabbarBuilderState extends State<TabbarBuilder> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorWeight: 3,
      indicatorColor: indigo,
      unselectedLabelStyle: police,
      labelStyle: police.copyWith(color: indigo),
      physics: const BouncingScrollPhysics(),
      isScrollable: true,
      tabs: [
        Text("data", style: police),
        Text("data", style: police),
        Text("data", style: police),
        Text("data", style: police),
        Text("data", style: police),
        Text("data", style: police),
      ],
    );
  }
}
