import 'package:courseacademy/pages/sign_in/block/sign_in_blocks.dart';
import 'package:courseacademy/pages/welcome/block/welcome_block.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyBlocProviders{
  static get lisBlockProvider{
    return [
      BlocProvider(create: (context) => WelcomeBloc()),
      BlocProvider(create: (context) => SignInBlock()),
    ];
  }
}