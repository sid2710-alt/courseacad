import 'package:courseacademy/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child:
          Container(color: AppColors.primarySecondaryBackground, height: 1.0),
    ),
    title: Text("Log In",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        )),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google'),
          _reusableIcons('facebook'),
          _reusableIcons('apple')
        ],
      ));
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String text, String textType, String iconName) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Row(
        children: [
          Container(
            height: 16.h,
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset('assets/icons/$iconName.png'),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: text,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  )),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp),
              autocorrect: false,
              obscureText: textType == 'password',
            ),
          )
        ],
      ));
}

Widget forgetPasswordWidget() {
  return SizedBox(
    height: 44.h,
    width: 260.w,
    child: GestureDetector(
      onTap: () {},
      child: const Text('Forget Password',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 15,
          )),
    ),
  );
}

Widget buildLogInAndRegisterButton(String buttonLabel) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttonLabel == 'Log In'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: buttonLabel == 'Log In'
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
          child: Text(
        buttonLabel,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonLabel == 'Log In'
                ? AppColors.primaryBackground
                : AppColors.primaryText),
      )),
    ),
  );
}
