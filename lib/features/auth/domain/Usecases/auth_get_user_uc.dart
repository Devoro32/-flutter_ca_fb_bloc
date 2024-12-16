import 'package:ca_firebase_app/export.dart';

import 'package:fpdart/fpdart.dart';

class AuthGetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<AuthRepository>().getUser();
  }
}
