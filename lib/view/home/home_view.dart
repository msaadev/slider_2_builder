import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider_2_builder/core/components/slider/home_slider.dart';

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
                return HomeSlider(data: data);
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
    var getData = await rootBundle.loadString('assets/dummy/dummy_json.json');
    var data = json.decode(getData);
    return data;
  }
}
