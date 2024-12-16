import 'package:ca_firebase_app/export.dart';

import 'package:fpdart/fpdart.dart';

class AuthSendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return getIt<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
