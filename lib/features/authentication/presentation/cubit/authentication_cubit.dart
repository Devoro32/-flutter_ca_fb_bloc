// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';

import 'package:ca_firebase_app/export.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationCubitState> {
  AuthenticationCubit({
    required CreateUser createUser,
    required GetUsers getUsers,
  })  : _createUser = createUser,
        _getUsers = getUsers,
        super(const AuthenticationCubitInitial());

  final CreateUser _createUser;
  final GetUsers _getUsers;

  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    emit(const CreatingUserCubit());

    final result = await _createUser(CreateUserParams(
      createdAt: createdAt,
      name: name,
      avatar: avatar,
    ));

    result.fold(
      (failure) => emit(AuthenticationErrorCubit(failure.errorMessage)),
      (_) => emit(const UserCreatedCubit()),
    );
  }

  Future<void> getUsers() async {
    emit(const GettingUsersCubit());
    final result = await _getUsers();

    result.fold(
      (failure) => emit(AuthenticationErrorCubit(failure.errorMessage)),
      (users) => emit(UsersLoadedCubit(users)),
    );
  }
}
