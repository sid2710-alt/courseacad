import 'package:courseacademy/pages/register/bloc/register_bloc.dart';
import 'package:courseacademy/pages/register/bloc/register_controller.dart';
import 'package:courseacademy/pages/register/bloc/register_events.dart';
import 'package:courseacademy/pages/register/bloc/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Sign Up'),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: reusableText('Enter Your details below and signUp')),
                Container(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  margin: EdgeInsets.only(top: 36.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Username'),
                      buildTextField('Enter your username here', 'name',
                          'user', (value) {
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                          }),
                      reusableText('Email'),
                      buildTextField(
                          'Enter your email here', 'email', 'user', (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      }),
                      reusableText('Password'),
                      buildTextField('Enter your password here', 'password',
                          'lock', (value) {
                            context.read<RegisterBloc>().add(PasswordEvent(value));
                          }),
                      reusableText('Re-enter your password'),
                      buildTextField('Confirm your password', 'password',
                          'lock', (value) {
                            context.read<RegisterBloc>().add(RePasswordEvent(value));
                          }),
                      reusableText('Enter Your details below and signUp'),
                      const SizedBox(height: 20),
                      buildLogInAndRegisterButton('Register', () {
                        RegisterController(context: context).handleEmailRegister();
                      })
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      );
    });
  }
}
