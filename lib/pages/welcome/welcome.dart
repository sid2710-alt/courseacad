import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
            body: Container(
          margin: EdgeInsets.only(top: 37.h),
          color: Colors.white,
          child: Scaffold(
              body: Container(
            width: 375.w,
            child: Stack(
              children: [
                PageView(
                  children: [
                    _page(1, context, 'Next', 'First See Learning','Learn Every Day, Live Every Day, Grow Every Day','http'),
                    _page(2, context, 'Next', 'First See Learning','Learn Every Day, Live Every Day, Grow Every Day','http'),
                    _page(3, context, 'Get Started', 'First See Learning','Learn Every Day, Live Every Day, Grow Every Day','http')

                  ],
                )
              ],
            ),
          )),
        )));
  }

  Widget _page(int index,BuildContext context, String buttonName, String title, String subTitle, String imagePath){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: const Text("Image 1"),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 100.h, left: 25.w, right: 25.w),
          height: 50.w,
          width: 325.w,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
            BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              )
            ],
          ),
          child: Center(
              child: Text(buttonName,style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
              )),
        ),

      ],
    );
  }
}

