import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {

  Future<List> get getAlbums async {
    var getData = await Dio().get('https://raw.githubusercontent.com/msaadev/dummy_slider_data/main/dummy_data.json');
    var data = json.decode(getData.data);
    return data;
  }

}
