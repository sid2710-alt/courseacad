import 'package:courseacademy/pages/sign_in/sign_in.dart';
import 'package:courseacademy/pages/welcome/block/welcome_block.dart';
import 'package:courseacademy/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> WelcomeBloc(),
      child: ScreenUtilInit(builder: (context,child)=>  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white
          )
        ),
        home: const Welcome(),
        routes: {
          '/signIn': (context) =>const SignIn(),
        },

      )),
    );

  }
}

