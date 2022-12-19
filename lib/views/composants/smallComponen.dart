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
          height: 220,
          // width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl(movies.image),
                  cacheKey: movies.id.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.8),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movies.title,
                  style: title2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3),
              const Expanded(child: SizedBox()),
              Text(
                "Genre : ${movies.genre}",
                style: appBarpolice.copyWith(
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: blanclaire),
                overflow: TextOverflow.ellipsis,
              ),
              spacer(10),
              // Wrap(
              //   children: [
              //     const Icon(Icons.thumb_up, color: Colors.white),
              //     const SizedBox(width: 15),
              //     Text(
              //         movies.voteCount < 1000
              //             ? movies.voteCount.toString()
              //             : "${(movies.voteCount).toStringAsFixed(2)}K",
              //         style: title2.copyWith(
              //             fontWeight: FontWeight.normal,
              //             color: blanclaire,
              //             fontSize: 12))
              //   ],
              // ),
              spacer(8),
              Text(
                movies.countryName,
                style: title1.copyWith(fontSize: 10, color: blanclaire),
              ),
              Text(
                movies.dateSortie,
                style: title1.copyWith(fontSize: 10, color: blanclaire),
              )
            ],
          ),
        )
      ],
    );
  }
}
