import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modles/Archeved%20Tasks/archeved.dart';
import 'package:flutter_app/modles/DoneTasks/Done.dart';
import 'package:flutter_app/modles/new_tasks/New_tasts.dart';
import 'package:flutter_app/modles/users/users.dart';
import 'package:flutter_app/shered/Componens/componens.dart';
import 'package:flutter_app/shered/Componens/constanes.dart';
import 'package:flutter_app/shered/cubit/cubit.dart';
import 'package:flutter_app/shered/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';





class homelayout extends StatelessWidget{
  int curnetindex=0;

  var scaffoldKey=GlobalKey<ScaffoldState>();

  var contttt=TextEditingController();
  var cont=TextEditingController();
  var control=TextEditingController();
  var Kt=GlobalKey<FormState>();
  /*Future <String> MyName() async {
    return "Ahmed Muhammed ";
  }*/

  @override
  Widget build(BuildContext context) {
    Appcubit cubit =Appcubit().get(context);
    return BlocProvider(
      create: (BuildContext context)=>Appcubit(),//..CreatDatebase(),
      child:BlocConsumer<Appcubit,AppState>(
        listener: (context,state){
          /*if (state is AppinsertDataBase){
            Navigator.pop(context);
          }*/
        },
        builder: (context,state){
          return Scaffold(
            key:scaffoldKey,
            appBar: AppBar(title:
            Text(cubit.title[cubit.curentinedx]),),
            body: ConditionalBuilder(
              condition: true,
              builder: (context)=>cubit.screan[cubit.curentinedx],
              fallback:(context) =>Center(child: CircularProgressIndicator()),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.curentinedx,
              onTap: (index) {
               cubit.changescreans(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: "Archive",
                )

              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if (cubit.colose) {
                  if (Kt.currentState.validate()) {
                    cubit.insetData(Aitle: control.text, time: cont.text, data: contttt.text);
                  //.then((value) {
                      //opendata(database).then((value) {
                       //
                        //setState(()
                        //{
                        //colose=false;
                        //data=value;
                        //print(data[4]);
                        //fibbutton = Icons.edit;
                        //});
                      //});
                    //});
                  }
                }
                else {
                  scaffoldKey.currentState.showBottomSheet(
                        (context) => Container(
                      //color: Colors.grey[100],
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: Kt,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            importForm(
                              controller:control,
                              Text:("Task Title"),
                              valudat: (String value){
                                if (value.isEmpty){
                                  return ("The Text must be enter");
                                }
                                return null;
                              },
                              Iconsss: Icons.title,
                              Keybord:TextInputType.text,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            importForm(
                                controller:cont,
                                Text:("Time Title"),
                                valudat: (String value){
                                  if (value.isEmpty){
                                    return ("The Time Must Be Enter");
                                  }
                                  return null;
                                },
                                Iconsss: Icons.watch_later_outlined,
                                Keybord:TextInputType.datetime,
                                onTap: (){
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()).then((value) =>
                                  cont.text=value.format(context),
                                  );
                                }

                            ),
                            SizedBox(
                              height: 20,
                            ),
                            importForm(
                                controller:contttt,
                                Text:("Date Title"),
                                valudat: (String value){
                                  if (value.isEmpty){
                                    return ("The Date Must Be Enter");
                                  }
                                  return null;
                                },
                                Iconsss: Icons.calendar_today,
                                Keybord:TextInputType.datetime,
                                onTap: (){
                                  showDatePicker(
                                      context: context,
                                      initialDate:DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse("2021-12-10")).then(
                                          (value) =>{
                                        contttt.text=DateFormat.yMMMd().format(value),
                                      }

                                  );
                                }

                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 100,
                  ).closed.then((value){
                    cubit.onchange(false, Icons.edit);
                  });
                  cubit.onchange(true, Icons.add);
                }


              },
              child: Icon(cubit.fibbutton),
            ),
          );
        },

      ),
    );
  }
}

