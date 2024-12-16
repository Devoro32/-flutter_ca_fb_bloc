//user entity can be used acrossed multiple features

//core  cannot depend on other features
//other features can depend on core

class CaUserEntity {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  CaUserEntity(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.image,
      required this.gender});
}
