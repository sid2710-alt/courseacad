import 'package:courseacademy/pages/welcome/block/welcome_block.dart';
import 'package:courseacademy/pages/welcome/block/welcome_events.dart';
import 'package:courseacademy/pages/welcome/block/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
            body: BlocBuilder<WelcomeBloc,WelcomeState>(
              builder: (context, state) {
                return Container(
          margin: EdgeInsets.only(top: 37.h),
          color: Colors.white,
          child: Scaffold(
                  body: Container(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter ,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index){
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      },
                      children: [
                        _page(1, context, 'Next', 'First See Learning','Learn Every Day, Live Every Day, Grow Every Day','assets/images/reading.png'),
                        _page(2, context, 'Next', 'First See Learning','Learn Every Day, Live Every Day, Grow Every Day','assets/images/boy.png'),
                        _page(3, context, 'Get Started', 'First See Learning','Learn Every Day, Live Every Day, Grow Every Day','assets/images/man.png')

                      ],
                    ),
                    Positioned(
                      bottom: 120.h,
                        child:
                    DotsIndicator(position:state.page,dotsCount: 3,mainAxisAlignment: MainAxisAlignment.center, decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )

                    ),),

                    )
                  ],
                ),
          )),
        );
              }
            )));
  }

  Widget _page(int index,BuildContext context, String buttonName, String title, String subTitle, String imagePath){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
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
        GestureDetector(
          onTap: (){
             if(index<3){
                pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
             } else{
                Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
             }
          },
          child: Container(
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
        ),

      ],
    );
  }
}

