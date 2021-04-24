import 'dart:developer';

import 'MissionPatchDTO.dart';

class RocketLaunchDTO {
  String id;
  String name;
  DateTime date;
  bool success;
  MissionPatchDTO patch;

  RocketLaunchDTO({this.id,
    this.name,
    this.date,
    this.success,
    this.patch});

  factory RocketLaunchDTO.fromJson(Map<String, dynamic> json) {

    return RocketLaunchDTO(
        id: json['id'],
        name: json['name'],
        date: DateTime.parse(json['date_utc']),
        success: json['success'],
        patch: MissionPatchDTO.fromJson(json['links']['patch']));
  }
}
