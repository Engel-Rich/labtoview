import 'package:flutter/material.dart';

import '../../variables/themes.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) =>
          profileBuildert('assets/profile$index.jpg'),
    );
  }
}

Widget profileBuildert(String image) => CircleAvatar(
      backgroundColor: fondColors,
      child: ClipOval(
        child: Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
