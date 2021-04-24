
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';

abstract class GetRocketsUseCase {

  // Get a list of rockets;
  Future<List<Rocket>> getRockets();

  // Set whether the app has been opened for the first time to true.
  void setAppOpenForFirstTime();

  // Check to see if the app has opened for the first time.
  Future<bool> isAppOpenForFirstTime();

}