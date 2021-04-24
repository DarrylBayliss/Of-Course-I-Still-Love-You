class MissionPatchDTO {
  String small;
  String large;

  MissionPatchDTO({this.small, this.large});

  factory MissionPatchDTO.fromJson(Map<String, dynamic> json) {
    return MissionPatchDTO(small: json['small'], large: json['large']);
  }
}
