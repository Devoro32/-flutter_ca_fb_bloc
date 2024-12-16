import 'package:ca_firebase_app/export.dart';

import 'package:fpdart/fpdart.dart';

class AuthSigninUseCase implements UseCase<Either, UserSigninModel> {
  @override
  Future<Either> call({UserSigninModel? params}) async {
    return getIt<AuthRepository>().signin(params!);
  }
}
