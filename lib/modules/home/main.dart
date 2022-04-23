import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/_home%20layout.dart';
import 'package:flutter_app/modules/counter/counter.dart';
import 'package:flutter_app/modules/login_Screan/loginscrean.dart';
import 'package:flutter_app/shered/bloc_observer/bloc%20obeserver.dart';
void main(){
  Bloc.observer = MyBlocObserver();
  runApp(appp());
}
class appp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:homelayout()
    );
  }
}
