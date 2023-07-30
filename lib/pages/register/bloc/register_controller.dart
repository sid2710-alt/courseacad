import 'package:courseacademy/common/widgets/flutter_toast.dart';
import 'package:courseacademy/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:go_router/go_router.dart';

class RegisterController {
  final BuildContext context;
  const  RegisterController({required this.context});
  void handleEmailRegister() async {
    try {
        final state = context
            .read<RegisterBloc>()
            .state;
        String name = state.userName;
        String emailAddress = state.email;
        String password = state.password;
        String rePassword = state.rePassword;

        if (name.isEmpty) {
          toastInfo(message: 'Your name is empty');
          return;
        }
        if (emailAddress.isEmpty) {
          toastInfo(message: 'Your Email is Empty');
          return;
        }
        if (password.isEmpty) {
          toastInfo(message: 'Your password is Empty');
          return;
        }
        if (rePassword.isEmpty) {
          toastInfo(message: "Please Enter Password Again");
        }
        if (rePassword != password) {
          toastInfo(message: "Passwords do not match");
        }

        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
          var user = credential.user;
          if (user == null) {
            toastInfo(message: 'User does not exist');
            return;
          } else {
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(name);
            toastInfo(message: "An Email Has benn sent to activate you account");
            if(context.mounted){
              GoRouter.of(context).pop();
            }

          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-user') {
            toastInfo(message: 'The provided email is already in use');
            return;
          } else if (e.code == 'weak-password') {
            toastInfo(message: 'Week Password provided');
            return;
          } else if(e.code == 'invalid-email'){
            toastInfo(message: 'Provide Email is not Valid');
            return;
          }
        }

    } catch (e) {}
  }
}



