import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SliderController extends GetxController {
  RxInt activeIndex = 0.obs;
  final urlImages = [
    //'assets/images/icons8-online-store-30.png',
    'assets/images/s1.webp',
    'assets/images/s2.jpeg',
    'assets/images/s3.jpg',
    'assets/images/s4.jpg',
    'assets/images/s5.png'
  ].obs;

  sliderImages(int index) {
    activeIndex.value = index;
  }
}
