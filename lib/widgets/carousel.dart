// ignore_for_file: unnecessary_const

import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter/material.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({Key? key}) : super(key: key);

  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  final List _isHovering = [false, false, false, false, false, false, false];
  final List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return //iterates through the images and returns a ClipRRect
        images
            .map(
              //ClipRRect creates a card with customizable border size
              (element) => ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  element,
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        //check out dbesttech tutorial on carouselslider
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                //used to get the text to overlay
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        //for desktops aspect ratio should be over 2
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        screenSize.width < 800
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Colors.blueGrey[900]
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}