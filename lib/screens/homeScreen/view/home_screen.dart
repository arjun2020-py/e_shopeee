import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/slider_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffff4181),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('eShoppe'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active))
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: controller.urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = controller.urlImages[index];
              return BuildImages(urlImage, index);
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              onPageChanged: (index, reason) {
                controller.sliderImages(index);

                // final activeIndex = index;
              },
            ),
          ),
          BuildIndicator()
        ],
      ),
    );
  }

  Widget BuildIndicator() => AnimatedSmoothIndicator(
        activeIndex: controller.activeIndex.value,
        count: controller.urlImages.length,
        effect: const JumpingDotEffect(),
        onDotClicked: (index) {
          controller.activeIndex.value = index;
        },
      );

  Widget BuildImages(String urlImages, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        urlImages,
        fit: BoxFit.fill,
      ),
    );
  }
}
