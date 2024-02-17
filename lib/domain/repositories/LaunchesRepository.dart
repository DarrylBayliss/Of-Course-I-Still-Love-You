import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'dart:async';

abstract class LaunchesRepository {
  // Gets the list of rockets
  Future<List<Rocket>> getRockets();

  // Gets the list of launches, based on the rocket id passed in via the RocketLaunchQuery.
  Future<List<RocketLaunch>> getLaunchesForRocket(String rocketId);
}
