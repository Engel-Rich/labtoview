import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:test/controllers/moviescontroller.dart';
import 'package:test/variables/globalconst.dart';
import 'package:test/variables/themecontroller.dart';
import 'package:test/variables/themes.dart';
import 'package:test/views/composants/drawer.dart';
import 'package:test/views/composants/futuremoviecomposant.dart';
import 'package:test/views/composants/futusmallcomponen.dart';

import '../composants/listprofile.dart';
import '../composants/tabarbuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentI = 0;
  final pages = [
    const Center(
      child: Icon(
        Icons.search,
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
    CircleAvatar(
      backgroundColor: fondColors,
      backgroundImage: const AssetImage("assets/profile1.jpg"),
    ),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    ThemeController().getThemeStatus();
    ControllerMovies().listMouvie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FaIcon(Icons.arrow_back_ios, size: 24),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: ListTile(
          trailing:
              const CircleAvatar(radius: 15, backgroundColor: Colors.lightBlue),
          title: Text("USA", style: appBarpolice),
          subtitle: Text("TODAY", style: appBarpolice),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(width: 2),
            ),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
          RollingSwitch.icon(
            onChanged: (bool change) {},
            rollingInfoLeft: RollingIconInfo(
                icon: Icons.dark_mode, backgroundColor: fondColors),
            rollingInfoRight: RollingIconInfo(
                icon: Icons.light_mode, backgroundColor: fondColors),
            animationDuration: const Duration(milliseconds: 550),
          ),
          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const FaIcon(FontAwesomeIcons.filter),
          )
        ],
      ),
      body: curentI == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      // height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: const ListProfile(),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: const TabbarBuilder(),
                    ),
                    Container(
                      height: 180,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ControllerMovies().listMouvie().isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (context, index) {
                                return FutureListComposant(
                                    movie:
                                        ControllerMovies().listMouvie()[index]);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 8);
                              },
                              itemCount: 40)
                          : Center(
                              child: Text('Aucun film trouvé', style: title1),
                            ),
                    ),
                    spacer(12),
                    Text('Les Plus polulaires', style: title2),
                    spacer(12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: ControllerMovies().listMouvie().length,
                      itemBuilder: (context, index) {
                        return FuturSmallComponen(
                            movie: ControllerMovies().listMouvie()[index]);
                      },
                    )
                  ],
                ),
              ),
            )
          : pages[curentI + 1],
      drawer: const DrawerBuil(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curentI,
        onTap: (val) {
          setState(() {
            curentI = val;
          });
        },
        selectedLabelStyle: police,
        unselectedLabelStyle: police,
        showSelectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Explore",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: "Trending",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "save",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: fondColors,
              backgroundImage: const AssetImage("assets/profile1.jpg"),
            ),
            label: "Engelbert",
          ),
        ],
      ),
    );
  }
}
