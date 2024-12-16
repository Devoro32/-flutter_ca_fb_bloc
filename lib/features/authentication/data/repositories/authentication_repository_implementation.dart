// import 'package:dartz/dartz.dart';
// import 'package:tdd_tutorial/core/errors/exceptions.dart';
// import 'package:tdd_tutorial/core/errors/failure.dart';
// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/data/datasources/authentication_remote_data_source.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ca_firebase_app/export.dart';

class AuthenticationRepositoryImplementation
    implements DBFBAuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final DBFBAuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // Test-Driven Development
    // call the remote data source
    // check if the method returns the proper data
    // make sure that it returns the proper data if there is no exception
    // // check if when the remoteDataSource throws an exception, we return a
    // failure
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CAFBUserModel>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  Future<Either> dbsignupRepo(DBAuthUserCreationReqModel users) async {
    try {
      await _remoteDataSource.dbsignupDS(users);
      return const Right(null);
    } catch (e) {
      //TODO: Where do i put in the error message?
      return Left(DBFailure);
    }
  }
}
