// Mocks generated by Mockito 5.0.15 from annotations
// in library_project/test/core/generate_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart'
    as _i2;
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeUserModel_0 extends _i1.Fake implements _i2.UserModel {}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i3.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> cacheUser(_i2.UserModel? user) =>
      (super.noSuchMethod(Invocation.method(#cacheUser, [user]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.UserModel> getCachedUser() =>
      (super.noSuchMethod(Invocation.method(#getCachedUser, []),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel_0()))
          as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<void> deleteCachedUser() =>
      (super.noSuchMethod(Invocation.method(#deleteCachedUser, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.UserModel> getVerificationCode(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#getVerificationCode, [],
                  {#email: email, #password: password}),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel_0()))
          as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<void> logout() =>
      (super.noSuchMethod(Invocation.method(#logout, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> verifyCode({String? email, String? code}) =>
      (super.noSuchMethod(
          Invocation.method(#verifyCode, [], {#email: email, #code: code}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.UserModel> updateUser(
          {String? name,
          String? email,
          String? oldPassword,
          String? newPassword,
          String? id}) =>
      (super.noSuchMethod(
              Invocation.method(#updateUser, [], {
                #name: name,
                #email: email,
                #oldPassword: oldPassword,
                #newPassword: newPassword,
                #id: id
              }),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel_0()))
          as _i4.Future<_i2.UserModel>);
  @override
  _i4.Future<_i2.UserModel> login({String? email, String? password}) => (super
      .noSuchMethod(
          Invocation.method(#login, [], {#email: email, #password: password}),
          returnValue: Future<_i2.UserModel>.value(_FakeUserModel_0())) as _i4
      .Future<_i2.UserModel>);
  @override
  String toString() => super.toString();
}
