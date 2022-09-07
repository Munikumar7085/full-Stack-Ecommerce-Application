
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:full_stack_ecommerce/constants/global_variables.dart';

class CarouselImageSlider extends StatelessWidget {
  const CarouselImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (context) {
              return Image.network(
                i,
                fit: BoxFit.cover,
                height:  200,

              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 200,
        autoPlay: true, 
      ),
    );
  }
}
