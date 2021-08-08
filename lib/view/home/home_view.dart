import 'package:flutter/material.dart';
import 'package:slider_2_builder/core/components/slider/home_slider.dart';
import 'package:slider_2_builder/view/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;
  late final Future future;
  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    future = _viewModel.getAlbums ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: ListView(
        children: [
          sliderFuture()
        ],
      ),
    );
  }

  FutureBuilder<dynamic> sliderFuture() {
    return FutureBuilder(
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
        );
  }
}
