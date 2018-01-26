// GENERATED CODE - DO NOT MODIFY BY HAND

part of example_server.src.models.user;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class User extends _User {
  @override
  String id;

  @override
  String name;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  User({this.id, this.name, this.createdAt, this.updatedAt});

  factory User.fromJson(Map data) {
    return new User(
        id: data['id'],
        name: data['name'],
        createdAt: data['created_at'] is DateTime
            ? data['created_at']
            : (data['created_at'] is String
                ? DateTime.parse(data['created_at'])
                : null),
        updatedAt: data['updated_at'] is DateTime
            ? data['updated_at']
            : (data['updated_at'] is String
                ? DateTime.parse(data['updated_at'])
                : null));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static User parse(Map map) => new User.fromJson(map);

  User clone() {
    return new User.fromJson(toJson());
  }
}
