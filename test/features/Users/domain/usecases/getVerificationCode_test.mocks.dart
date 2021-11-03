// Mocks generated by Mockito 5.0.15 from annotations
// in library_project/test/features/Users/domain/usecases/getVerificationCode_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:library_project/unilib/core/domain/entities/user/user_set_profile.dart'
    as _i3;
import 'package:library_project/unilib/core/domain/entities/user/verifiedUser.dart'
    as _i2;
import 'package:library_project/unilib/features/Users/Domain/Entities/User.dart'
    as _i6;
import 'package:library_project/unilib/features/Users/Domain/Repository/user_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeVerifiedUser_0 extends _i1.Fake implements _i2.VerifiedUser {}

class _FakeUserWithProfile_1 extends _i1.Fake implements _i3.UserWithProfile {}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i4.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.User?> signIn(Map<String, dynamic>? info) =>
      (super.noSuchMethod(Invocation.method(#signIn, [info]),
          returnValue: Future<_i6.User?>.value()) as _i5.Future<_i6.User?>);
  @override
  _i5.Future<_i6.User?> login(Map<String, dynamic>? info) =>
      (super.noSuchMethod(Invocation.method(#login, [info]),
          returnValue: Future<_i6.User?>.value()) as _i5.Future<_i6.User?>);
  @override
  _i5.Future<bool> logout(_i2.VerifiedUser? user) =>
      (super.noSuchMethod(Invocation.method(#logout, [user]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> getVerificationCode() =>
      (super.noSuchMethod(Invocation.method(#getVerificationCode, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.VerifiedUser> verifyUser(_i6.User? user, dynamic code) =>
      (super.noSuchMethod(Invocation.method(#verifyUser, [user, code]),
              returnValue:
                  Future<_i2.VerifiedUser>.value(_FakeVerifiedUser_0()))
          as _i5.Future<_i2.VerifiedUser>);
  @override
  _i5.Future<_i3.UserWithProfile> setProfile(_i2.VerifiedUser? user) =>
      (super.noSuchMethod(Invocation.method(#setProfile, [user]),
              returnValue:
                  Future<_i3.UserWithProfile>.value(_FakeUserWithProfile_1()))
          as _i5.Future<_i3.UserWithProfile>);
  @override
  String toString() => super.toString();
}