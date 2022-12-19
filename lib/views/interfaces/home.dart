import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:rolling_switch/rolling_switch.dart';
import 'package:test/controllers/moviescontroller.dart';
import 'package:test/variables/globalconst.dart';
import 'package:test/variables/themecontroller.dart';
import 'package:test/variables/themes.dart';
import 'package:test/views/composants/articlecomponen.dart';
import 'package:test/views/composants/drawer.dart';
import 'package:test/views/composants/smallComponen.dart';

import '../composants/listprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int curentI = 0;
  final pages = [
    const Center(
      child: Icon(
        Icons.home,
        size: 40,
        color: indigo,
      ),
    ),
    const Center(
      child: Icon(
        Icons.search,
        size: 40,
        color: indigo,
      ),
    ),
    const Center(
      child: Icon(
        Icons.trending_up,
        size: 40,
        color: indigo,
      ),
    ),
    const Center(
      child: Icon(
        Icons.push_pin,
        size: 40,
        color: indigo,
      ),
    ),
    SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: CircleAvatar(
          backgroundColor: fondColors,
          radius: 70,
          backgroundImage: const AssetImage("assets/profile1.jpg"),
        ),
      ),
    ),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool? isDrakMode;
  TextStyle? styleobj;
  TabController? controller;

  setStyle() {
    setState(() {
      styleobj = !Get.isDarkMode
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
    });
  }

  @override
  void initState() {
    isDrakMode = Get.isDarkMode;
    setStyle();
    controller = TabController(length: 5, vsync: this);
    debugPrint(isDrakMode.toString());
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ControllerMovies>();
    return Scaffold(
      backgroundColor: !isDrakMode! ? Colors.white : fonddark,
      appBar: AppBar(
        leading: Center(
            child: FaIcon(
          Icons.arrow_back_ios,
          size: 30,
          color: !isDrakMode! ? Colors.black : Colors.white,
        )),
        // leadingWidth: 30,
        titleSpacing: 0.0,
        backgroundColor: !isDrakMode! ? Colors.white : fonddark,
        elevation: 0.0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            const CircleAvatar(radius: 17, backgroundColor: Colors.lightBlue),
            const SizedBox(width: 2),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("USA",
                      style: appBarpolice.copyWith(
                          fontSize: 14,
                          color: !isDrakMode! ? Colors.black : Colors.white,
                          letterSpacing: 0.0)),
                  Text(
                    "TODAY",
                    style: appBarpolice.copyWith(
                        fontSize: 14,
                        color: !isDrakMode! ? Colors.black : Colors.white,
                        letterSpacing: 0.0),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          Container(
            height: 20,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  width: 2,
                  color: isDrakMode! ? Colors.white : Colors.grey.shade900),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: !isDrakMode! ? Colors.black : Colors.white,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              ThemeController().switchTheme();
              setState(() {
                isDrakMode = Get.isDarkMode;
              });
              setStyle();
              print(isDrakMode);
            },
            icon: FaIcon(
              isDrakMode! ? Icons.dark_mode : Icons.light_mode,
              color: !isDrakMode! ? Colors.black : Colors.white,
            ),
          ),
          // RollingSwitch.icon(
          //   height: 40,
          //   width: 70,
          //   innerSize: 30,
          //   onChanged: (bool change) {},
          //   rollingInfoLeft: RollingIconInfo(
          //       icon: Icons.dark_mode, backgroundColor: fondColors),
          //   rollingInfoRight: RollingIconInfo(
          //       icon: Icons.light_mode, backgroundColor: fondColors),
          //   animationDuration: const Duration(milliseconds: 550),
          // ),

          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Image.asset("assets/icon.png",
                height: 80,
                width: 80,
                color: isDrakMode! ? Colors.white : Colors.black),
          )
        ],
      ),
      body: curentI == 0
          ? ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                spacer(20),
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListProfile(),
                ),
                spacer(10),
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TabbarBuilder(),
                ),
                Obx(
                  () => Container(
                    height: 345,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: controller.movieList.isNotEmpty
                        ? ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ArticleCoponen(
                                  movies: controller.movieList[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 18);
                            },
                            itemCount: controller.movieList.length ~/ 2 > 1
                                ? controller.movieList.length ~/ 2
                                : 1,
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                                backgroundColor: indigo),
                          ),
                  ),
                ),
                spacer(12),
                Text('Les Plus polulaires',
                    style: title2.copyWith(
                        color:
                            isDrakMode! ? Colors.white : Colors.grey.shade900)),
                spacer(12),
                Obx(
                  () => controller.movieList.isNotEmpty
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 220),
                          itemCount: controller.movieList.length,
                          itemBuilder: (context, index) {
                            return SmallComponen(
                                movies: controller.movieList[Random()
                                    .nextInt(controller.movieList.length)]);
                            // : SmallComponen(
                            //     movies: controller.movieList[index]);
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: indigo),
                        ),
                ),
              ],
            )
          : pages[curentI],
      drawer: const DrawerBuil(),
      bottomNavigationBar: isDrakMode == null
          ? null
          : BottomNavigationBar(
              currentIndex: curentI,
              type: BottomNavigationBarType.fixed,
              onTap: (val) {
                setState(() {
                  curentI = val;
                });
              },
              selectedLabelStyle: police.copyWith(color: Colors.grey),
              unselectedLabelStyle: police.copyWith(color: Colors.grey),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              backgroundColor:
                  !isDrakMode! ? Colors.white : Colors.grey.shade900,
              elevation: 0.0,
              selectedItemColor: indigo,
              unselectedItemColor: Colors.grey,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: "Explore",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: "Trending",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.push_pin),
                  label: "save",
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundColor: fondColors,
                    backgroundImage: const AssetImage("assets/profile1.jpg"),
                  ),
                  label: "profile",
                ),
              ],
            ),
    );
  }

  Widget TabbarBuilder() {
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
