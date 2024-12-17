import 'package:ca_firebase_app/export.dart';

part 'auth_event.dart';
part 'auth_state.dart';

//Blog
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignupUseCase _userSignUp;
  final AuthSigninUseCase _userLogin;
  final AuthGetUserUseCase _currentUser;
  //determine if the user is logged in or not
  //this is connected to the app_cubit
  //used in void _emitAuthSuccess
  final AppUserCubit _appUserCubit;
  AuthBloc({
    //name arguments, assign the constructor to a private variable
    required AuthSignupUseCase userSignUp,
    required AuthSigninUseCase userLogin,
    required AuthGetUserUseCase currentUser,
    //determine if the user is signed in or not
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    //https://youtu.be/ELFORM9fmss?t=14493
    //this will run first so you dont have to put AuthLoading into each blocmethod
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

//TODO: Need to complete
  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(
        // NoParams()
        );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignUp(
      params: UserCreationModel(
        firstName: event.firstName,
        email: event.email,
        password: event.password,
        lastName: event.lastName,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userLogin(
      params: UserSigninModel(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

//TODO: Need to be completed
  void _emitAuthSuccess(
    CaUserEntity user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
