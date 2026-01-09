class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.image,
  });

  final int id;
  final String name;
  final String status;
  final String gender;
  final String image;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      status: json['status'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'gender': gender,
    'image': image,
  };
}
