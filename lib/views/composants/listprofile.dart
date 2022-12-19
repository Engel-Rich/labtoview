import 'package:flutter/material.dart';

import '../../variables/themes.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) =>
          profileBuildert('assets/profile$index.jpg'),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
    );
  }
}

Widget profileBuildert(String image) => CircleAvatar(
      radius: 28,
      foregroundColor: indigo.shade900,
      child: CircleAvatar(
        backgroundColor: fondColors,
        radius: 26,
        backgroundImage: AssetImage(image),
      ),
    );
