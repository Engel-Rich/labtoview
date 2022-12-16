import 'package:flutter/material.dart';
import 'package:test/models/movies.dart';
import 'package:test/variables/themes.dart';
import 'package:test/views/composants/smallComponen.dart';

class FuturSmallComponen extends StatefulWidget {
  final Future<Movies?> movie;
  const FuturSmallComponen({super.key, required this.movie});

  @override
  State<FuturSmallComponen> createState() => _FuturSmallComponenState();
}

class _FuturSmallComponenState extends State<FuturSmallComponen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies?>(
      future: widget.movie,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: police,
              ),
            );
          } else {
            return snapshot.hasData && snapshot.data != null
                ? SmallComponen(movies: snapshot.data!)
                : const SizedBox.shrink();
          }
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: Text(
              'ConnexionError',
              style: police,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: indigo),
          );
        }
      },
    );
  }
}
