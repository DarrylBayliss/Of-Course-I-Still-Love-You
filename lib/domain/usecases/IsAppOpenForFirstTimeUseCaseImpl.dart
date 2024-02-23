import 'package:of_course_i_still_love_you/domain/repositories/AppConfigRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/IsAppOpenForFirstTimeUseCase.dart';

class IsAppOpenForFirstTimeUseCaseImpl implements IsAppOpenForFirstTimeUseCase {
  final AppConfigRepository _appConfigRepository;

  IsAppOpenForFirstTimeUseCaseImpl(this._appConfigRepository);

  @override
  Future<bool> isAppOpenForFirstTime() async {
    return _appConfigRepository.isAppOpenForFirstTime();
  }
}
