import 'package:fpdart/fpdart.dart';
import 'package:ca_firebase_app/export.dart';

typedef ResultFuture<T> = Future<Either<DBFailure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;
