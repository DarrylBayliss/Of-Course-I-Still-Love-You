import 'MissionPatchDTO.dart';

class RocketLaunchDTO {
  String id;
  String name;
  DateTime date;
  bool success;
  MissionPatchDTO patch;

  RocketLaunchDTO(
      {required this.id,
      required this.name,
      required this.date,
      required this.success,
      required this.patch});

  factory RocketLaunchDTO.fromJson(Map<String, dynamic> json) {
    return RocketLaunchDTO(
        id: json['id'],
        name: json['name'],
        date: DateTime.parse(json['date_utc']),
        success: json['success'],
        patch: MissionPatchDTO.fromJson(json['links']['patch']));
  }
}
