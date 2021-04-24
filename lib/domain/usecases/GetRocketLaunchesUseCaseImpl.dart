
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/entities/RocketLaunch.dart';
import 'package:of_course_i_still_love_you/domain/repositories/LaunchesRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketLaunchesUseCase.dart';

class GetRocketLaunchesUseCaseImpl implements GetRocketLaunchesUseCase {

  final LaunchesRepository _launchesRepository;

  GetRocketLaunchesUseCaseImpl(this._launchesRepository);

  Future<List<RocketLaunch>> getLaunchesForRocket(Rocket rocket) async {

    try {
      return await _launchesRepository.getLaunchesForRocket(rocket.id);
    } catch (exception) {
      return Future.error(exception);
    }
  }
}