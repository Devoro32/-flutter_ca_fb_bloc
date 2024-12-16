import 'package:ca_firebase_app/export.dart';
import 'dart:convert';

//From ecommerce
class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.image,
      required this.gender});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

//TODO: what is this functionality?
extension UserXModel on UserModel {
  CaUserEntity toEntity() {
    return CaUserEntity(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        image: image,
        gender: gender);
  }
}
