class SpaceXModel {
  final String id;
  final String model;
  final String image;
  final String status;
  final List<String> roles;
  final num year_built;
  final String type;

  SpaceXModel(
      {required this.id,
        required this.type,
      required this.status,
      required this.image,
      required this.model,
      required this.roles,
      required this.year_built});

  factory SpaceXModel.fromJson(Map<String, dynamic> json) {
    return SpaceXModel(

      id: json["id"] as String? ?? "",
      status: json["status"] as String? ?? "",
      image: json["image"] as String? ?? "",
      model: json["model"] as String? ?? "",
      roles: json["roles"] as List<String>? ?? [],
      year_built: json["year_built"] as num? ?? 0,
      type: json["type"] as String? ?? "",
    );
  }
}
