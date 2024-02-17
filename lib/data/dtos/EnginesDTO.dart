class EnginesDTO {
  final int number;

  EnginesDTO({required this.number});

  factory EnginesDTO.fromJson(Map<String, dynamic> json) {
    return EnginesDTO(number: json['number']);
  }
}
