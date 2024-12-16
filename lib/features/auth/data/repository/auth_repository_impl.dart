import 'package:ca_firebase_app/export.dart';
import 'package:ca_firebase_app/init_dependencies.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationModel user) async {
    return await getIt<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> signin(UserSigninModel user) async {
    return await getIt<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await getIt<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await getIt<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await getIt<AuthFirebaseService>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data) {
      return Right(UserModel.fromMap(data).toEntity());
    });
  }
}
