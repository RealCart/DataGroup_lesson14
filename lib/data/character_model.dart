class CharacterModel {
  const CharacterModel({
    required this.name,
    required this.imageUrl,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'] as String,
      imageUrl: json['image'] as String,
    );
  }

  final String name;
  final String imageUrl;
}
