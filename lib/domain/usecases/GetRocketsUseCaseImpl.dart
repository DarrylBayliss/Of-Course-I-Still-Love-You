import 'dart:async';

import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';
import 'package:of_course_i_still_love_you/domain/repositories/LaunchesRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/GetRocketsUseCase.dart';

class GetRocketsUseCaseImpl implements GetRocketsUseCase {
  final LaunchesRepository _launchesRepository;

  GetRocketsUseCaseImpl(this._launchesRepository);

  @override
  Future<List<Rocket>> getRockets() async {
    try {
      return await _launchesRepository.getRockets();
    } catch (exception) {
      return Future.error(exception);
    }
  }
}
