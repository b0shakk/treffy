import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'dart:math';

import 'package:treffy_portfolio/onHover.dart';

final List<String> images_low = [
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
  'assets_low/11.jpg',
  'assets_low/12.jpg',
  'assets_low/13.jpg',
  'assets_low/14.jpg',
  'assets_low/15.jpg',
  'assets_low/16.jpg',
  'assets_low/17.jpg',
  'assets_low/18.jpg',
  'assets_low/19.jpg',

  'assets_low/20.jpg',
  'assets_low/21.jpg',
  'assets_low/22.jpg',
  'assets_low/23.jpg',
  'assets_low/24.jpg',
  'assets_low/25.jpg',
  'assets_low/26.jpg',
  'assets_low/27.jpg',
  'assets_low/28.jpg',
  'assets_low/29.jpg',

  'assets_low/30.jpg',
  'assets_low/31.jpg',
  'assets_low/32.jpg',
  'assets_low/33.jpg',
];

class PhotographsPage extends StatefulWidget {
  const PhotographsPage({super.key});

  @override
  State<PhotographsPage> createState() => _PhotographsPageState();
}

class _PhotographsPageState extends State<PhotographsPage> {
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool isBlur = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: MasonryGridView.builder(
        itemCount: images_low.length,
        gridDelegate:
            SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: (width>800)?4:2),
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: onHover(
              child: InkWell(
                onTap: () {
                  showImageViewer(context, Image.asset(images_low[index]).image,
                      backgroundColor: Colors.transparent,
                      swipeDismissible: true,
                      doubleTapZoomable: true,
                      onViewerDismissed: (){
                        setState(() {
                          isBlur = !isBlur;
                        });
                      });
                  setState(() {
                    isBlur = !isBlur;
                  });
                },
                child: (isBlur) ? ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                  child: Image.asset(images_low[index])) : Image.asset(images_low[index]),
              ),
            )),
      ),
    );
  }
}
