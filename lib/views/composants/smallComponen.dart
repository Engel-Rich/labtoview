// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/models/movies.dart';
import 'package:test/variables/globalconst.dart';
import 'package:test/variables/themes.dart';

class SmallComponen extends StatelessWidget {
  final Movies movies;
  const SmallComponen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl(movies.image),
                  cacheKey: movies.id),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          height: 270,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Text(movies.title,
                  style: title2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2),
              spacer(8),
              Text(
                movies.description ?? "Genre : ${movies.genre}",
                style: appBarpolice.copyWith(
                  letterSpacing: 4,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              spacer(15),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: indigo,
                  child: Center(
                    child: Icon(Icons.thumb_up, color: Colors.white),
                  ),
                ),
                // title: Text(movies.genre, style: title2),
                title: Text(
                    movies.voteCount < 1000
                        ? movies.voteCount.toString()
                        : "${(movies.voteCount).toStringAsFixed(2)}K",
                    style: title2.copyWith(
                        fontWeight: FontWeight.normal, color: blanclaire)),
              ),
              spacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   movies.countryName,
                  //   style: title1.copyWith(fontSize: 12, color: blanclaire),
                  // ),
                  Text(
                    movies.dateSortie,
                    style: title1.copyWith(fontSize: 12, color: blanclaire),
                  ),
                  Text(
                    movies.popularity < 1000
                        ? movies.popularity.toString()
                        : "${(movies.popularity).toStringAsFixed(2)}K",
                    style: title1.copyWith(fontSize: 12, color: blanclaire),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
