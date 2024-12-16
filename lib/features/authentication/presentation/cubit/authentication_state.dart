part of 'authentication_cubit.dart';

abstract class AuthenticationCubitState extends Equatable {
  const AuthenticationCubitState();

  @override
  List<Object> get props => [];
}

class AuthenticationCubitInitial extends AuthenticationCubitState {
  const AuthenticationCubitInitial();
}

class CreatingUserCubit extends AuthenticationCubitState {
  const CreatingUserCubit();
}

class GettingUsersCubit extends AuthenticationCubitState {
  const GettingUsersCubit();
}

class UserCreatedCubit extends AuthenticationCubitState {
  const UserCreatedCubit();
}

class UsersLoadedCubit extends AuthenticationCubitState {
  const UsersLoadedCubit(this.users);

  final List<AuthFBUser> users;

  @override
  List<Object> get props => users.map((user) => user.id).toList();
}

class AuthenticationErrorCubit extends AuthenticationCubitState {
  const AuthenticationErrorCubit(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
