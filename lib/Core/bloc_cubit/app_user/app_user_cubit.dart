import 'package:ca_firebase_app/export.dart';

part 'app_user_state.dart';
//https://youtu.be/ELFORM9fmss?t=13713

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(CaUserEntity? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }
  }
}
