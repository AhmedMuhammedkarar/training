import 'package:bloc/bloc.dart';
import 'package:flutter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class countercubit extends Cubit<counterState>{
  countercubit() : super(counterIntal());
  static countercubit get (context)=>BlocProvider.of(context);
  int counter=1;
  void Mins(){
    counter--;
    emit(countermins());
  }
  void plus(){
   counter++;
   emit (counterplus());
  }

}



/*import 'package:flutter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(initialState());
 static CounterCubit get(context)=>BlocProvider.of(context);
  int counter =1;
  void min(){
    counter--;
    emit(minssState());

  }
  void mix(){
    counter++;
    emit(pluseState());
  }


}
*/
