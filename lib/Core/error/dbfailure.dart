import 'package:ca_firebase_app/export.dart';

abstract class DBFailure extends Equatable {
  const DBFailure({
    required this.message,
  });

  final String message;

  String get errorMessage => 'Error: $message';

  @override
  List<Object> get props => [message];
}

class APIFailure extends DBFailure {
  const APIFailure({
    required super.message,
  });

  APIFailure.fromException(APIException exception)
      : this(
          message: exception.message,
        );
}
