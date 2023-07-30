import 'package:courseacademy/common/widgets/flutter_toast.dart';
import 'package:courseacademy/pages/sign_in/block/sign_in_blocks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBlock>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(message: 'Your Email is Empty');
          return;
        }
         if (password.isEmpty) {
          toastInfo(message: 'Your password is Empty');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          var user = credential.user;
          if (user == null) {
            toastInfo(message: 'User does not exist');
            return;
          }
          if (!user!.emailVerified) {
            toastInfo(message: 'Your email is not verified');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: 'User not found');
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(message: 'Email or password is wrong');
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(message: 'Email or password is wrong');
            return;
          }
        }
      }
    } catch (e) {}
  }
}
