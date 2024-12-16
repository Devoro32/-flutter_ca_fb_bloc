import 'package:ca_firebase_app/export.dart';

class AuthIsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await getIt<AuthRepository>().isLoggedIn();
  }
}
