import 'package:of_course_i_still_love_you/data/dtos/RocketDTO.dart';
import 'package:of_course_i_still_love_you/data/dtos/RocketLaunchDTO.dart';
import 'dart:async';

abstract class ApiDataSource {
  // Get a list of RocketDTOs
  Future<List<RocketDTO>> getRockets();

  // Get a List of RocketLaunchDTOs
  Future<List<RocketLaunchDTO>> getLaunchesForRocket(String rocketId);
}
