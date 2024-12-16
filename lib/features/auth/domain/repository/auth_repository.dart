import 'package:ca_firebase_app/export.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationModel user);
  Future<Either> signin(UserSigninModel user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
