import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/models/movies.dart';
import 'package:test/variables/globalconst.dart';
import 'package:test/variables/themes.dart';

class ArticleCoponen extends StatelessWidget {
  final Movies movies;
  const ArticleCoponen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 270,
          width: MediaQuery.of(context).size.width * 0.8,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: indigo,
                  )
                ],
              ),
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
                movies.description ??
                    "Aucune description n'est disponible pour ce filme",
                style: appBarpolice.copyWith(
                  letterSpacing: 4,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
              spacer(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: indigo,
                      child: Center(
                        child: Icon(Icons.thumb_up, color: Colors.white),
                      ),
                    ),
                    title: Text(movies.genre, style: title2),
                    subtitle: Text(
                        movies.voteCount < 1000
                            ? movies.voteCount.toString()
                            : "${(movies.voteCount).toStringAsFixed(2)}K",
                        style: title2.copyWith(
                            fontWeight: FontWeight.normal, color: blanclaire)),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    movies.dateSortie,
                    style: title1.copyWith(fontSize: 12, color: blanclaire),
                  ),
                ],
              ),
              spacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movies.countryName,
                    style: title1.copyWith(fontSize: 12, color: blanclaire),
                  ),
                  Text(
                    'Popularity :',
                    style: title1.copyWith(fontSize: 12, color: blanclaire),
                  ),
                  Text(
                    movies.popularity.toString(),
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
