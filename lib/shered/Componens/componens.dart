import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget Button({
  double Aidth =double.infinity,
  Color Aackground=Colors.blue,
  Function function,
  bool inuppuer=true,
  double x=0.0,
  BoxDecoration e,
  BorderRadius s,
  String text ,
})=>Container(
    height: 40,
    width: Aidth,

    child:Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(x),
        color: Aackground,
      ),
      child:MaterialButton(
        onPressed: function,
        child: Text(inuppuer?text.toUpperCase():text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),),
    )
);






//Icons.remove_red_eye_sharp
Widget importForm({
 TextEditingController controller,
  String Text,
  Function valudat,
  Function onSubmit,
  Function inChange,
  IconData Iconsss,
  TextInputType Keybord,
  bool abscure=false,
  IconData suffix,
  Function setstate,
Function onTap,
})=>TextFormField(
  controller:controller,
  decoration: InputDecoration(
    labelText: Text,
    border:OutlineInputBorder(),
    prefixIcon: Icon(
      Iconsss,
    ),
    suffixIcon: suffix!=null? IconButton(
        icon: Icon(suffix),
      onPressed: setstate,
    ):null,
  ),
  keyboardType: Keybord,
  onFieldSubmitted: onSubmit,
  onChanged: inChange,
  validator:valudat,
  obscureText:abscure ,
onTap: onTap,
);

Widget  impBuild(Map module)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Row(

    children: [

      CircleAvatar(

        radius: 40,

        child: Text("${module["title"]}"),

      ),

      SizedBox(

        width: 20,

      ),

      Column(

        mainAxisSize: MainAxisSize.min,

        children: [

          Text("${module["data"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          Text("${module["time"]}",style: TextStyle(fontSize: 20,color: Colors.grey),)

        ],

      )

    ],

  ),
);







