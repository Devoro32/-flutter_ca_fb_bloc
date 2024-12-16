// import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:ca_firebase_app/export.dart';

//dbestech
abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}
