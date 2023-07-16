import 'package:courseacademy/pages/sign_in/block/sign_in_blocks.dart';
import 'package:courseacademy/pages/sign_in/block/sign_in_events.dart';
import 'package:courseacademy/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'block/signin_states.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

 class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlock, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(child :reusableText('Or login Using your email')),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(top: 36.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(height: 5.h,),
                          buildTextField('Enter your email here', 'email','user',(value){
                            context.read<SignInBlock>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          SizedBox(height: 5.h,),
                          buildTextField('Enter your password here', 'password','lock', (value) {
                            context.read<SignInBlock>().add(
                                PasswordEvent(value));
                          }),
                          forgetPasswordWidget(),
                          buildLogInAndRegisterButton('Log In'),
                          SizedBox(height: 20.h),
                          buildLogInAndRegisterButton('Register')

                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
        );
      }
    );
  }
}
