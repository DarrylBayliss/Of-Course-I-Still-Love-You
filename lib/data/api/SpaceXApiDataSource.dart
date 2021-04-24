import 'dart:convert';
import 'dart:developer';
import 'package:of_course_i_still_love_you/data/dtos/RocketDTO.dart';
import 'package:of_course_i_still_love_you/data/dtos/RocketLaunchDTO.dart';
import '../Constants.dart';
import 'package:http/http.dart' as http;

import 'ApiDataSource.dart';

class SpaceXApiDataSource implements ApiDataSource {

  static const int _success_status_code = 200;

  Future<List<RocketDTO>> getRockets() async {
    Uri url = Uri.parse(Constants.getRocketsEndpoint);
    final response = await http.get(url);

    if (response.statusCode == _success_status_code) {
      final parsedJson = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsedJson
          .map<RocketDTO>((json) => RocketDTO.fromJson(json))
          .toList();
    } else {
      throw Exception('Couldn\'t load rockets');
    }
  }

  Future<List<RocketLaunchDTO>> getLaunchesForRocket(String rocketId) async {
    Uri url = Uri.parse(Constants.getRocketLaunchesEndpoint);
    final response = await http.post(url,
        body: jsonEncode(<String, dynamic>{
          'query': {'rocket': rocketId}
        }));

    if (response.statusCode == _success_status_code) {
      final parsedJson = jsonDecode(response.body);

      return parsedJson['docs']
          .map<RocketLaunchDTO>(
              (json) => RocketLaunchDTO.fromJson(json))
          .toList();
    } else {
      throw Exception('Couldn\'t load rocket launch');
    }
  }
}
