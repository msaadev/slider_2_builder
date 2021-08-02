import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    future = getAlbums;
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
                      return Container(
                        child: Image.network('${item['url']}'),
                      );
                    },
                    options: CarouselOptions());
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
}
