import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dio gets', () {
    test('get', () async {
      var getData = await Dio().get(
          'https://raw.githubusercontent.com/msaadev/dummy_slider_data/main/dummy_data.json');
      var data = json.decode(getData.data);
      expect(true, data is List);
    });
  });
}
