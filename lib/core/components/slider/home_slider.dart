import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:slider_2_builder/core/components/card/slider_card.dart';

class HomeSlider extends StatefulWidget {
  final List data;

  const HomeSlider({Key? key, required this.data}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late final CarouselController _slider1, _slider2;

  @override
  void initState() {
    super.initState();
    _slider1 = CarouselController();
    _slider2 = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        slider1(),
        slider2(),
      ],
    );
  }

  CarouselSlider slider1() {
    return CarouselSlider.builder(
        carouselController: _slider1,
        itemCount: widget.data.length,
        itemBuilder: (c, i, _) {
          var item = widget.data[i];
          return SliderCard(url: item['url']);
        },
        options: CarouselOptions(
          aspectRatio: 1920 / 1080,
          viewportFraction: 1,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          onPageChanged: (page, reason) {
            if (reason == CarouselPageChangedReason.manual) {
              _slider2.animateToPage(page);
            }
          },
        ));
  }

  CarouselSlider slider2() {
    return CarouselSlider.builder(
        carouselController: _slider2,
        itemCount: widget.data.length,
        itemBuilder: (c, i, _) {
          var item = widget.data[i];
          return InkWell(
              onTap: () {
                _slider2.animateToPage(i);
              },
              child: SliderCard(url: item['url']));
        },
        options: CarouselOptions(
          aspectRatio: 1920 / 300,
          autoPlay: true,
          viewportFraction: .15,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          onPageChanged: (page, reason) => changePage(page, reason, _slider1),
        ));
  }

  void changePage(int page, CarouselPageChangedReason reason,
      CarouselController controller) {
    controller.animateToPage(page);
    // if (reason == CarouselPageChangedReason.manual) {
    //   controller.animateToPage(page);
    // }
  }
}
