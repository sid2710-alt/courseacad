import 'package:courseacademy/pages/sign_in/block/sign_in_events.dart';
import 'package:courseacademy/pages/sign_in/block/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBlock extends Bloc<SignInEvent, SignInState> {
  SignInBlock() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(password: event.password));
  }
}
