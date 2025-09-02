import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/error/exception.dart';
import 'package:ecommerce_fruits/core/error/failures.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/core/service/backend_endpoints.dart';
import 'package:ecommerce_fruits/core/service/database_service.dart';
import 'package:ecommerce_fruits/core/service/firebase_auth_service.dart';
import 'package:ecommerce_fruits/features/auth/data/models/user_model.dart';
import 'package:ecommerce_fruits/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      final userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      await deleteUser(user);
      return left(ServerFailure(LocaleKeys.unknownError.tr()));
    }
  }

  /// Deletes the user from Firebase if the user is not null.
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  /// Signs in the user with email and password.
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntity userEntity = await getUserData(uid: user.uid);
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(LocaleKeys.unknownError.tr()));
    }
  }

  /// Signs in the user with Google.
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      // To handle user data
      // if user exists it retrieves the user data.
      // if user does not exist it adds the user data.
      await handleUserData(user, userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithGoogle: ${e.toString()}');
      await deleteUser(user);
      return left(ServerFailure(LocaleKeys.unknownError.tr()));
    }
  }

  /// Signs in the user with Facebook.
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();

      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      // To handle user data
      // if user exists it retrieves the user data.
      // if user does not exist it adds the user data.
      await handleUserData(user, userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithFacebook: ${e.toString()}');
      await deleteUser(user);
      return left(ServerFailure(LocaleKeys.unknownError.tr()));
    }
  }

  /// Adds user data to the database.
  @override
  Future<void> addUserData({required UserEntity user}) {
    return databaseService.addData(
      path: BackendEndpoints.addUserDataEndPoint,
      data: UserModel.fromUserEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  /// Retrieves user data from the database.
  @override
  Future<UserEntity> getUserData({required String uid}) async {
    final data = await databaseService.getData(
      path: BackendEndpoints.getUserDataEndPoint,
      documentId: uid,
    );
    return UserModel.fromJson(data);
  }

  /// Handles user data by checking if the user exists in the database.
  /// If the user does not exist, it adds the user data to the database.
  /// If the user exists, it retrieves the user data.
  Future<void> handleUserData(User user, UserEntity userEntity) async {
    bool isUserExists = await databaseService.checkIfDataExists(
      path: BackendEndpoints.getUserDataEndPoint,
      documentId: user.uid,
    );
    saveUserData(user: userEntity);
    if (!isUserExists) {
      log('User does not exist, adding user data');
      await addUserData(user: userEntity);
    } else {
      log('User exists, retrieving user data');
      await getUserData(uid: user.uid);
    }
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromUserEntity(user).toMap());
    SharedPrefHelper().setValueForKey(
      key: SharedPrefKeys.userData,
      value: jsonData,
    );
  }
}
