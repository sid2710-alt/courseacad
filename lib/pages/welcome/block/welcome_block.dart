import 'package:courseacademy/pages/welcome/block/welcome_events.dart';
import 'package:courseacademy/pages/welcome/block/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState>{
   WelcomeBloc():super(WelcomeState()){
     on<WelcomeEvent> ((event, emit){
       emit(WelcomeState(page: state.page));
     });
   }
}
