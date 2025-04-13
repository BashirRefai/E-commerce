// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  final int? id;
  final String name;
  final String avatar;
  final String role;
  ProfileModel({
    this.id,
    required this.role,
    required this.name,
    required this.avatar,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "role": role,
        "avatar": avatar,
      };
}
