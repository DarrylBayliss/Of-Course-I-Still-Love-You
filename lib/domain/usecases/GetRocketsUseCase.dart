import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'dart:async';

abstract class GetRocketsUseCase {
  // Get a list of rockets;
  Future<List<Rocket>> getRockets();
}
