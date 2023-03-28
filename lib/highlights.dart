import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> images = [
  'assets_low/01.jpg',
  'assets_low/02.jpg',
  'assets_low/03.jpg',
  'assets_low/04.jpg',
  'assets_low/05.jpg',
  'assets_low/06.jpg',
  'assets_low/07.jpg',
  'assets_low/08.jpg',
  'assets_low/09.jpg',
  'assets_low/10.jpg',
];

List<Widget> generateImageTile() {
  return images
      .map((e) => ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                e,
                fit: BoxFit.cover,
              ),
            ),
          ))
      .toList();
}

class HighlightsPage extends StatefulWidget {
  const HighlightsPage({super.key});

  @override
  State<HighlightsPage> createState() => _HighlightsPageState();
}

class _HighlightsPageState extends State<HighlightsPage> {
  final _carouselController = CarouselController();

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       child: Stack(children: [
  //     CarouselSlider(
  //       items: generateImageTile(),
  //       carouselController: _carouselController,
  //       options: CarouselOptions(
  //         enlargeCenterPage: true,
  //         autoPlay: true,
  //         autoPlayInterval: Duration(seconds: 5),
  //         autoPlayCurve: Curves.linearToEaseOut,
  //       ),
  //     ),
  //     Align(
  //       alignment: Alignment.centerLeft,
  //       child: IconButton(
  //         onPressed: () {
  //           // Use the controller to change the current page
  //           _carouselController.previousPage();
  //         },
  //         icon: Icon(Icons.navigate_before_outlined),
  //       ),
  //     ),
  //     Align(
  //       alignment: Alignment.centerRight,
  //       child: IconButton(
  //         onPressed: () {
  //           // Use the controller to change the current page
  //           _carouselController.nextPage();
  //         },
  //         icon: Icon(Icons.navigate_next_outlined),
  //       ),
  //     ),
  //   ]));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
          onTap: () {
            _carouselController.nextPage();
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: CarouselSlider(
              items: generateImageTile(),
              carouselController: _carouselController,
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayCurve: Curves.linearToEaseOut,
              ),
            ),
          ),
        ));
  }
}
