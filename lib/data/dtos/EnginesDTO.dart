class EnginesDTO {
  final int number;

  EnginesDTO({this.number});

  factory EnginesDTO.fromJson(Map<String, dynamic> json) {
    return EnginesDTO(number: json['number']);
  }
}
