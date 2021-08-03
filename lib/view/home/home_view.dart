import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider_2_builder/core/components/card/slider_card.dart';
import 'package:slider_2_builder/model/album.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final Future future;
  @override
  void initState() {
    super.initState();
    future = getAlbums1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getAlbums;
        },
      ),
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: future,
            builder: (context, AsyncSnapshot s) {
              if (s.hasData) {
                var data = s.data;
                return CarouselSlider.builder(
                    itemCount: data.length,
                    itemBuilder: (c, i, _) {
                      var item = data[i];
                      return SliderCard(
                        url: item['url'],
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 1920 / 1080,
                      autoPlay: true,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                    ));
              } else if (s.hasError) {
                return Center(child: Text('Lütfen Tekrar Deneyiniz'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }

  Future<List> get getAlbums async {
    var getData =
        await Dio().get('https://jsonplaceholder.typicode.com/photos');
    return getData.data;
  }

  Future<List> get getAlbums1 async {
    var getData = await rootBundle.loadString('assets/dummy/dummy_json.json');
    var data = json.decode(getData);
    return data;
  }
}
