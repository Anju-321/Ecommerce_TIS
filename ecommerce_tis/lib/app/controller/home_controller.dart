import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  
  HomeController({int currentIndex = 0}) {
    this.currentIndex.value = currentIndex;
  }

  
  
  setIndex(int index) {
    currentIndex(index);
  }
}
