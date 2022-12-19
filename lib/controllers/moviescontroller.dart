import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/models/movies.dart';
import 'package:test/variables/globalconst.dart';

class ControllerMovies extends GetxController {
  RxList<Movies> movieList = <Movies>[].obs;
  var isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
    listMouvie();
  }

  Future<Movies?> getOnMovie(idMovie) async {
    final uri = Uri.parse(url(idMovie));
    // print("start $uri}");
    final value = await http.get(uri);
    if (value.statusCode != 200) return null;
    final result = jsonDecode(value.body);
    if (result['success'] != null && result['success'] == false) return null;
    try {
      final mouve = Movies.fromApi(result);
      // debugPrint('${mouve.id}: ${mouve.toMap()}');
      return mouve;
    } catch (e) {
      return null;
    }
  }

  // por avoir une liste de movies
  listMouvie() async {
    final list = List.generate(100, (index) => Random().nextInt(500) + 120);
    // print(list);
    for (final id in list) {
      final movie = await getOnMovie(id);
      if (movie != null) {
        movieList.add(movie);
        isloading.value = true;
        update();
      }
      print(movieList().length);
    }
  }

  // end of classe
}
