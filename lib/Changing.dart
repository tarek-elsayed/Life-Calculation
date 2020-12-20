import 'package:flutter/material.dart';


class Changing extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Changing();
  }
}
class _Changing extends State<Changing>{
  var _currencies=['Select','Dollar','Pound','Euro'];
  var _currenciesSelect="Select";
  var _currenciesSelect1="Select";

  double result=0;
  final value=TextEditingController();
  double _value=0;

  BoxDecoration myBox(){
    return BoxDecoration(
      border: Border.all(
          width: 2,
          color: Colors.black
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.brown,
       centerTitle: true,
       title: Text("Changing"),
       leading: IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed:()=> Navigator.of(context).pop()
       ),
     ),
     body: Container(
         padding: EdgeInsets.only(top: 20,left: 10),
         child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Text("Select Frist Money",
                     style: TextStyle(
                         fontSize: 22.5,color: Colors.black54,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                 ],
               ),
               Padding(padding: EdgeInsets.only(bottom: 20)),
               Row(
                 children: <Widget>[

                   Container(
                     padding: EdgeInsets.only(left: 10),
                     height: 60,
                     width: 150,
                     child: TextField(
                       controller: value,
                       decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.black),
                             borderRadius: BorderRadius.all(Radius.circular(8.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.black,
                               width: 2,
                             ),
                             borderRadius: BorderRadius.circular(30),
                           )
                       ),
                       keyboardType:TextInputType.number,
                     ),
                   ),
                   Padding(padding: EdgeInsets.only(right: 45)),
                   Container(
                     padding: EdgeInsets.only(left: 20),
                     child: DropdownButton<String>(
                       style: TextStyle(fontSize: 22.5,color: Colors.black),
                       items: _currencies.map((String drop){
                         return DropdownMenuItem<String>(
                           value: drop,
                           child: Text(drop),
                         );
                       }).toList(),
                       onChanged: (String newValue){
                         setState(() {
                           this._currenciesSelect=newValue;
                         });
                       },
                       value: _currenciesSelect,
                     ),
                   ),
                 ],
               ),
               Padding(padding: EdgeInsets.only(bottom: 30)),
               Row(
                 children: <Widget>[
                   Text("Select Second Money",
                     style: TextStyle(
                         fontSize: 22.5,color: Colors.black54,
                       fontWeight: FontWeight.bold
                     ),
                   ),
                 ],
               ),
               Padding(padding: EdgeInsets.only(bottom: 30)),
               Row(
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.only(left: 20),
                     child: DropdownButton(
                       style: TextStyle(fontSize: 22.5,color: Colors.black),
                       items: _currencies.map((String drop){
                         return DropdownMenuItem<String>(
                           value: drop,
                           child: Text(drop),
                         );
                       }).toList(),
                       onChanged: (String newValue){
                         setState(() {
                           this._currenciesSelect1=newValue;
                         });
                       },
                       value: _currenciesSelect1,
                     ),
                   ),
                   Padding(padding: EdgeInsets.only(right: 65)),
                   Text("$result",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                   /*Container(
                     height: 60,
                     width: 150,
                     child: TextField(
                       decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.black),
                             borderRadius: BorderRadius.all(Radius.circular(8.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.black,
                               width: 2,
                             ),
                             borderRadius: BorderRadius.circular(30),
                           )
                       ),
                       keyboardType:TextInputType.number,
                     ),
                   )*/
                 ],
               ),
               SizedBox(height: 30,),
               Center(
                 child: Container(
                   height: 40,
                   decoration: myBox(),
                   child: FlatButton(
                     onPressed: (){
                       setState(() {
                         _value=double.parse(value.text);
                        switch(_currenciesSelect) {
                          case "Dollar":
                            {
                              switch (_currenciesSelect1) {
                                case "Dollar":
                                  {
                                    result = double.parse((_value).toStringAsFixed(4));
                                  }
                                  break;
                                case "Pound":
                                  {
                                    result = double.parse(
                                        ((_value * 15.60)).toStringAsFixed(4));
                                  }
                                  break;
                                case 'Euro':
                                  {
                                    result = double.parse(
                                        ((_value * 0.84)).toStringAsFixed(4));
                                  }
                                  break;
                              }
                            }
                            break;
                          case "Pound":
                            {
                              switch (_currenciesSelect1) {
                                case "Pound":
                                  {
                                    result = double.parse((_value).toStringAsFixed(4));
                                  }
                                  break;
                                case "Dollar":
                                  {
                                    result = double.parse(
                                        ((_value / 15.60)).toStringAsFixed(4));
                                  }
                                  break;
                                case 'Euro':
                                  {
                                    result = double.parse(
                                        ((_value / 0.84)).toStringAsFixed(4));
                                  }
                                  break;
                              }
                            }
                            break;
                          case "Euro":
                            {
                              switch (_currenciesSelect1) {
                                case "Euro":
                                  {
                                    result = double.parse((_value).toStringAsFixed(4));
                                  }
                                  break;
                                case "Dollar":
                                  {
                                    result = double.parse(
                                        ((_value * 1.19)).toStringAsFixed(4));
                                  }
                                  break;
                                case 'Pound':
                                  {
                                    result = double.parse(
                                        ((_value * 18.49)).toStringAsFixed(4));
                                  }
                                  break;
                              }
                            }
                            break;
                          default:{
                            result=0;
                          }
                        }

                       });
                     },
                     child: Text("Convert",style: TextStyle(color: Colors.black),),
                   ),
                 ),
               ),

             ]
         )
     ),
   );
  }
}