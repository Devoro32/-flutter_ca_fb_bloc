// import 'package:tdd_tutorial/core/usecase/usecase.dart';
// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';

import 'package:ca_firebase_app/export.dart';

class GetUsers extends UsecaseWithoutParams<List<AuthFBUser>> {
  const GetUsers(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultFuture<List<AuthFBUser>> call() async => _repository.getUsers();
}
