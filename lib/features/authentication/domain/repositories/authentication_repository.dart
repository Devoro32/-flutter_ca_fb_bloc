// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:ca_firebase_app/export.dart';
import 'package:fpdart/fpdart.dart';

abstract class DBFBAuthenticationRepository {
  const DBFBAuthenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<AuthFBUser>> getUsers();

  //TODO: Can use type def
  Future<Either> dbsignupRepo(DBAuthUserCreationReqModel users);
}
