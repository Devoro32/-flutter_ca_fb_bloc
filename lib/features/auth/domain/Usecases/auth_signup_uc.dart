import 'package:ca_firebase_app/export.dart';

import 'package:fpdart/fpdart.dart';

class AuthSignupUseCase implements UseCase<Either, UserCreationModel> {
  @override
  Future<Either> call({UserCreationModel? params}) async {
    return await getIt<AuthRepository>().signup(params!);
  }
}
