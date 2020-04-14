import 'dart:async';

import 'package:ckcstudent/models/app_config.dart';
import 'package:http/http.dart' as http;


String url =
    'https://gist.githubusercontent.com/baoloc008/e49941470782511ea155fbe4f9dd78bc/raw/307fa0edba489303ba46c04a089adc7c7cc81258/appconfig.json';

Future<AppConfig> getAppConfig() async {
  final response = await http.get(url);
  return appConfigFromJson(response.body);
}
