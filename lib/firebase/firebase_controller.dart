import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createAccount(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      unawaited(userCredential.user!.sendEmailVerification());
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (exception) {
      _controlException(exception, context);
    } catch (e) {}

    return false;
  }

  Future<bool> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        return true;
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Verify your email')));
      }
    } on FirebaseAuthException catch (exception) {
      _controlException(exception, context);
    } catch (e) {}

    return false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  void _controlException(
      FirebaseAuthException exception, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(exception.message ?? '')));
    if (exception.code == 'email-already-in-use') {
    } else if (exception.code == 'invalid-email') {
    } else if (exception.code == 'operation-not-allowed') {
    } else if (exception.code == 'weak-password') {
    } else if (exception.code == 'user-disabled') {
    } else if (exception.code == 'user-not-found') {
    } else if (exception.code == 'wrong-password') {}
  }
}
