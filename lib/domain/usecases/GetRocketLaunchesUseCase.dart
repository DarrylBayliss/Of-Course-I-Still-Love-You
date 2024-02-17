import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'dart:async';

abstract class GetRocketLaunchesUseCase {
  // Get launches for a specific rocket
  Future<List<RocketLaunch>> getLaunchesForRocket(Rocket rocket);
}
