// import 'package:equatable/equatable.dart';
// import 'package:tdd_tutorial/core/usecase/usecase.dart';
// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';

import 'package:ca_firebase_app/export.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
