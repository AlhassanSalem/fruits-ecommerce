import 'package:dartz/dartz.dart';
import 'package:ecommerce_fruits/core/error/failures.dart';
import 'package:ecommerce_fruits/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future<void> addUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uid});

  Future<void> saveUserData({required UserEntity user});

}