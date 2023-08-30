import 'package:bloc_pratice/data/model/user_model_fields.dart';



class UserModel {
  int? id;

  final String firstname;
  final String lastname;
  final int age;
  final int gender;
  final String jobTitle;
  final int userId;

  UserModel({
    this.id,

    required this.userId,
    required this.gender,
    required this.age,
    required this.firstname,
    required this.jobTitle,
    required this.lastname,
  });

  UserModel copyWith({
     String? firstname,
     String? lastname,
     int? age,
     int? gender,
     String? jobTitle,
     int? userId,
    int? id,
  }) {
    return UserModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      jobTitle: jobTitle ?? this.jobTitle,
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      id: id ?? this.id,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json[UserModelFields.userId] as int? ?? 0,
      gender: json[UserModelFields.gender] as int? ?? 0,
      age: json[UserModelFields.age] as int? ?? 0,
      firstname: json[UserModelFields.firstname] as String? ?? "",
      lastname: json[UserModelFields.lastname] as String? ?? "",
      jobTitle: json[UserModelFields.jobTitle] as String? ?? "",
      id: json[UserModelFields.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserModelFields.userId: userId,
      UserModelFields.gender: gender,
      UserModelFields.age: age,
      UserModelFields.firstname: firstname,
      UserModelFields.lastname: lastname,
      UserModelFields.jobTitle: jobTitle,
    };
  }

  @override
  String toString() {
    return '''
      name: $firstname
      phone: $lastname
      id: $id, 
    ''';
  }
}