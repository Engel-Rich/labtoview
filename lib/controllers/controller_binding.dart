import 'package:get/get.dart';
import 'package:test/controllers/moviescontroller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControllerMovies>(ControllerMovies());
  }
}
