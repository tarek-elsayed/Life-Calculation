import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _BMI();
  }

}
class _BMI extends State<BMI>{


  final weight =new TextEditingController();
  double _weight=0;
  final height =new TextEditingController();
  double _height=0;
  double result=0;
  String status='';
  Color bb=Colors.black;

  BoxDecoration myBox(){
    return BoxDecoration(
      border: Border.all(
        width: 2,
        color: Colors.black
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }
  BoxDecoration myBox1(){
    return BoxDecoration(

      color: Colors.white70,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: Colors.white70,
        width: 0
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: Colors.blueGrey,
     appBar: AppBar(
       backgroundColor: Colors.brown,
       centerTitle: true,
       title: Text("BMI"),
       leading: IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed:()=> Navigator.of(context).pop()
       ),
     ),
     body: Center(
       child: Container(
         //margin: EdgeInsets.only(top: 30),
           height:300,
           width:MediaQuery.of(context).size.width,
           decoration: myBox1(),
           child: Container(
             padding: EdgeInsets.only(top: 20),
             child: Column(
               children: <Widget>[
                 Row(
                   children: <Widget>[
                     Text(" Weight (kg):",
                       style: TextStyle(
                       fontSize: 25.0,
                         fontWeight: FontWeight.bold
                     ),),
                     Padding(padding: EdgeInsets.only(right: 20)),
                     Container(
                       //decoration: myBox(),
                       height: 60,
                       width: 150,
                       child: TextField(
                         style: TextStyle(fontWeight: FontWeight.bold),
                         controller:weight,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.black,

                             ),
                             borderRadius:BorderRadius.all(Radius.circular(8.0)),

                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.black,
                                 width: 2,
                             ),
                             borderRadius:BorderRadius.all(Radius.circular(30.0)),
                           ),
                         ),

                         keyboardType:TextInputType.number,
                       ),
                     )
                   ],
                 ),

                 Padding(padding: EdgeInsets.only(bottom: 20)),

                 Row(
                   children: <Widget>[
                     Text(" Height (Cm):",
                       style: TextStyle(
                           fontSize: 25.0,
                           fontWeight: FontWeight.bold
                       ),),
                     Padding(padding: EdgeInsets.only(right: 12)),
                     Container(
                       //decoration: myBox(),
                       height: 60,
                       width: 150,
                       child: TextField(
                         style: TextStyle(fontWeight: FontWeight.bold),
                         controller: height,
                         decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     color: Colors.black
                                 ),
                               borderRadius:BorderRadius.all(Radius.circular(8.0)),
                             ),

                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.black,
                                 width: 2
                             ),
                             borderRadius:BorderRadius.all(Radius.circular(30.0)),
                           ),
                         ),
                         onTap: myBox,
                         keyboardType:TextInputType.number,
                       ),
                     )
                   ],
                 ),



                 SizedBox(height: 30,),
                 Center(
                   child: Container(
                     height: 40,
                     decoration: myBox(),
                     child: FlatButton(
                       onPressed:(){
                         setState(() {
                           _weight=double.parse(weight.text);
                           _height=double.parse(height.text)/100;
                           result=double.parse((_weight/(_height*_height)).toStringAsFixed(1));
                           if(result<18.5){
                             status="UnderWeight";
                             bb=Colors.blue;
                           }else if(result>=18.5&&result<=24.9){
                             status="Healthy";
                             bb=Colors.green;
                           }
                           else if(result>=25.0&&result<=29.9){
                             status='Overweight';
                             bb=Colors.deepOrangeAccent;
                           }else{
                             status="Obese";
                             bb=Colors.red;
                           }
                         });
                       } ,
                       child: Text("Result",style: TextStyle(color: Colors.black),),
                     ),
                   ),
                 ),
                 Padding(padding: EdgeInsets.only(bottom: 20),),
                 Text("BMI=$result $status",
                 style:TextStyle(fontSize: 20.0,color: bb,fontWeight: FontWeight.bold) ,
                 ),
               ],
             ),

         ),
       ),
     ),
   );
  }

}