import 'package:courseacademy/pages/block_providers.dart';
import 'package:courseacademy/pages/register/register.dart';
import 'package:courseacademy/pages/sign_in/block/sign_in_blocks.dart';
import 'package:courseacademy/pages/sign_in/sign_in.dart';
import 'package:courseacademy/pages/welcome/block/welcome_block.dart';
import 'package:courseacademy/pages/welcome/welcome.dart';
import 'package:courseacademy/routes/app_route_configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ApplyBlocProviders.lisBlockProvider,
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp.router(
            // routeInformationProvider: MyAppRouteConfigurations().router.routeInformationProvider,
            //     routeInformationParser:
            //         MyAppRouteConfigurations().router.routeInformationParser,
            //     routerDelegate:
            //         MyAppRouteConfigurations().router.routerDelegate,
            routerConfig: MyAppRouteConfigurations().router,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        elevation: 0, backgroundColor: Colors.white)),
              )),
    );
  }
}
