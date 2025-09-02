import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/error/exception.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: LocaleKeys.weakPassword.tr());
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: LocaleKeys.emailAlreadyInUse.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: LocaleKeys.networkError.tr());
      } else {
        throw CustomException(message: LocaleKeys.unknownError.tr());
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: LocaleKeys.unknownError.tr());
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: LocaleKeys.userNotFound.tr());
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: LocaleKeys.wrongPassword.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: LocaleKeys.networkError.tr());
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: LocaleKeys.invalidCredential.tr());
      } else {
        throw CustomException(message: LocaleKeys.unknownError.tr());
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: LocaleKeys.unknownError.tr());
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId:
            '457703650669-cb3j63ob9v9hgmvppdpm0tp4u2rd2ha2.apps.googleusercontent.com', // ضع الـ Web Client ID هنا
      );
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(
        credential,
      )).user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'network-request-failed') {
        throw CustomException(message: LocaleKeys.networkError.tr());
      } else {
        throw CustomException(message: LocaleKeys.unknownError.tr());
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()}');
      throw CustomException(message: LocaleKeys.unknownError.tr());
    }
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  static bool get isLoggedIn {
    return FirebaseAuth.instance.currentUser != null;
  }
}
