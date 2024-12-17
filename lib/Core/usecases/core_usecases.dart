import 'package:ca_firebase_app/export.dart';
import 'package:fpdart/fpdart.dart';

//usecase from the Blog
// abstract interface class UseCase<SuccessType, Params> {
//   Future<Either<Failure, SuccessType>> call(Params params);
// }

// class NoParams {}

//TODO: Place the EITHER in the USECASE like Blog
abstract interface class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

//taking this from blog
class NoParams {}
