import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Carousel_slider extends StatelessWidget {
  const Carousel_slider({
    super.key,
    required this.imgList,
  });

  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true, // Enable auto play
        enlargeCenterPage: true, // Enlarge the center image
        aspectRatio: 16 / 9, // Set aspect ratio
        viewportFraction: 1.0, // Set to 1.0 to display one image at a time
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                  child: Image.network(item,
                      fit: BoxFit.cover, width: double.infinity),
                ),
              ))
          .toList(),
    );
  }
}
