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
          height: 340,
          width: MediaQuery.of(context).size.width * 0.75,
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
          height: 340,
          width: MediaQuery.of(context).size.width * 0.75,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: indigo,
                    child: Icon(Icons.push_pin, color: Colors.white),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              Text(movies.title,
                  style: title2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2),
              spacer(5),
              Text(
                movies.description ??
                    "Aucune description n'est disponible pour ce filme",
                style: appBarpolice.copyWith(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              spacer(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      isThreeLine: false,
                      leading: const CircleAvatar(
                        backgroundColor: indigo,
                        child: Center(
                          child: Icon(Icons.thumb_up, color: Colors.white),
                        ),
                      ),
                      title: Text(
                        movies.genre,
                        style: title2.copyWith(
                            color: blanclaire,
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            letterSpacing: 0.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          movies.voteCount < 1000
                              ? movies.voteCount.toString()
                              : "${(movies.voteCount).toStringAsFixed(2)}K",
                          style: title2.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: blanclaire)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      movies.dateSortie,
                      style: title1.copyWith(fontSize: 12, color: blanclaire),
                    ),
                  ),
                ],
              ),
              spacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        movies.countryName,
                        style: title1.copyWith(fontSize: 10, color: blanclaire),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'Popularity :',
                        style: title1.copyWith(fontSize: 10, color: blanclaire),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        " ${movies.popularity.toStringAsFixed(2)}",
                        style: title1.copyWith(fontSize: 10, color: blanclaire),
                      ),
                    ),
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
