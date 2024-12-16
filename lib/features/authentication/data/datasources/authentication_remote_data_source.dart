import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:tdd_tutorial/core/errors/exceptions.dart';
// import 'package:tdd_tutorial/core/utils/constants.dart';
// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:ca_firebase_app/export.dart';
import 'package:fpdart/fpdart.dart';

abstract class DBFBAuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<CAFBUserModel>> getUsers();

  Future<Either> dbsignupDS(DBAuthUserCreationReqModel user);
}

const kCreateUserEndpoint = '/test-api/users';
const kGetUsersEndpoint = '/test-api/users';

class DBFBAuthRemoteDataSrcImpl implements DBFBAuthenticationRemoteDataSource {
  const DBFBAuthRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // 1. check to make sure that it returns the right data when the status
    // code is 200 or the proper response code
    // 2. check to make sure that it "THROWS A CUSTOM EXCEPTION" with the
    // right message when status code is the bad one
    try {
      final response =
          await _client.post(Uri.https(kBaseUrl, kCreateUserEndpoint),
              body: jsonEncode({
                'createdAt': createdAt,
                'name': name,
              }),
              headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CAFBUserModel>> getUsers() async {
    try {
      final response = await _client.get(
        Uri.https(kBaseUrl, kGetUsersEndpoint),
      );
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((userData) => CAFBUserModel.fromMap(userData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<Either> dbsignupDS(DBAuthUserCreationReqModel user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
      });

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }
}
