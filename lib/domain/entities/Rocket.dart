import 'package:of_course_i_still_love_you/data/dtos/RocketDTO.dart';
import 'package:of_course_i_still_love_you/domain/entities/Engines.dart';

class Rocket {
  final String id;
  final String name;
  final String country;
  final String description;
  final bool active;
  final List<dynamic> flickrImages;
  final Engines engines;

  Rocket(
      {this.id,
      this.name,
      this.country,
      this.description,
      this.active,
      this.flickrImages,
      this.engines});

  factory Rocket.fromDTO(RocketDTO rocketDTO) {
    return Rocket(
        id: rocketDTO.id,
        name: rocketDTO.name,
        country: rocketDTO.country,
        description: rocketDTO.description,
        active: rocketDTO.active,
        flickrImages: rocketDTO.flickrImages,
        engines: Engines.fromDTO(rocketDTO.engines));
  }
}
