import 'dart:async';

import 'package:http/http.dart' as http;

import 'models/category.dart';

String url =
    'https://gist.githubusercontent.com/baoloc008/cafb8bba1457079952bcb25e766fbfdd/raw/69b7265525054033879feb9520ac49c193df6d9c/ckc-student.json';

Future<List<Category>> fetchCategory() async {
  final response = await http.get(url);
  return categoryFromJson(response.body);
}
