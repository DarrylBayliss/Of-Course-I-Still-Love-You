import 'package:of_course_i_still_love_you/data/dtos/EnginesDTO.dart';

class Engines {
  final int number;

  Engines(this.number);

  factory Engines.fromDTO(EnginesDTO enginesDTO) {
    return Engines(enginesDTO.number);
  }
}
