 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child:
      Container(color: Colors.grey.withOpacity(0.5), height: 1.0),
    ),
    title: Text("Log In",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        )),
  );
}
Widget buildThirdPartyLogin(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),

    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround ,
      children: [
        _reusableIcons('google'),
        _reusableIcons('facebook'),
        _reusableIcons('apple')

      ],
    )
  );
}
Widget _reusableIcons(String iconame){
  return GestureDetector(
    onTap: (){},
    child: SizedBox(
      width: 40.w,
      height:40.w,
      child:Image.asset("assets/icons/$iconame.png"),
    ),
  );
}