import 'EnginesDTO.dart';

class RocketDTO {
  final String id;
  final String name;
  final String country;
  final String description;
  final bool active;
  final List<dynamic> flickrImages;
  final EnginesDTO engines;

  RocketDTO(
      {required this.id,
      required this.name,
      required this.country,
      required this.description,
      required this.active,
      required this.flickrImages,
      required this.engines});

  factory RocketDTO.fromJson(Map<String, dynamic> json) {
    return RocketDTO(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        description: json['description'],
        active: json['active'],
        flickrImages: json['flickr_images'],
        engines: EnginesDTO.fromJson(json['engines']));
  }
}
