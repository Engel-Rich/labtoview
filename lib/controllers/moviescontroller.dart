import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:test/models/movies.dart';
import 'package:test/variables/globalconst.dart';

class ControllerMovies {
  // pour avoir un Movies

  Future<Movies?> getOnMovie(idMovie) async {
    final uri = Uri.parse(url(idMovie));
    final value = await http.get(uri);
    if (value.statusCode != 200) return null;
    return Movies.fromApi(jsonDecode(value.body));
  }

  // por avoir une liste de movies
  List<Future<Movies?>> listMouvie() {
    final list = List.generate(100, (index) => Random().nextInt(10000) + 100);
    final listMovie = list.map((elid) async {
      Movies? move = await getOnMovie(elid);
      return move;
    }).toList();
    return listMovie;
  }

  // end of classe
}
