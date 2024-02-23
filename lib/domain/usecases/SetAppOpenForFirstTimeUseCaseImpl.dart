import 'package:of_course_i_still_love_you/domain/repositories/AppConfigRepository.dart';
import 'package:of_course_i_still_love_you/domain/usecases/SetAppOpenForFirstTimeUseCase.dart';

class SetAppOpenForFirstTimeUseCaseImpl
    implements SetAppOpenForFirstTimeUseCase {
  final AppConfigRepository _appConfigRepository;

  SetAppOpenForFirstTimeUseCaseImpl(this._appConfigRepository);

  @override
  void setAppOpenForFirstTime() {
    _appConfigRepository.setAppOpenForFirstTime();
  }
}
