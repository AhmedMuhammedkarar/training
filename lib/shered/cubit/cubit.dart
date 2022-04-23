import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/modles/DoneTasks/Done.dart';
import 'package:flutter_app/modles/new_tasks/New_tasts.dart';
import 'package:flutter_app/shered/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appcubit extends Cubit<AppStates>{
  Appcubit() : super(initialState());
  static Appcubit get(context){}
  int currentindex=0;
  List<Widget>Screans=[



    NewTasks(),
    DaneTasks(),
    ArchiveTasks(),
  ];
  List<String>Titles=[
    "New Taks",
    "Done Tasks",
    "Archive Tasks"
  ];

  void onchange(int index){
    currentindex =index;
    emit(changebuttonNav());
  }

}
