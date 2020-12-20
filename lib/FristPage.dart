

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frist_project/BMI.dart';
import 'package:frist_project/Changing.dart';
import 'package:frist_project/Discount.dart';
import 'package:frist_project/Length.dart';
import 'package:frist_project/Temperature.dart';
import 'package:frist_project/Time.dart';
import 'package:frist_project/percentage.dart';



class FristPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _FristPage();
  }


}
class _FristPage extends State<FristPage>{



  Future _showMyDialog(String value) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$value'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Calculation of $value'),

              ],
            ),
          ),
          actions: <Widget>[
           FlatButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  BoxDecoration myBox(){
    return BoxDecoration(

      //border: Border(bottom: BorderSide(width: 1,color: Colors.red,))
     //borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Life Calculator",style: TextStyle(
            shadows: [
          Shadow(color: Colors.black,blurRadius: 20)
        ]
        ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            child:
                ListView(
                  children: <Widget>[

                    Container(
                      height: 60,
                      decoration: myBox(),
                      child: ListTile(
                        onLongPress:(){ _showMyDialog("BMI");},
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>BMI()));
                          },
                        title: Text("BMI"),
                        leading: Icon(Icons.fitness_center),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: myBox(),
                      child: ListTile(
                        onLongPress:(){ _showMyDialog("Percentage");},
                        onTap:(){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>Percentage()));
                        },
                        title: Text("Percentage"),
                        leading: Icon(Icons.show_chart),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: myBox(),
                      child: ListTile(
                        onLongPress:(){ _showMyDialog("Discount");},
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Discount())
                          );
                        },
                        title: Text("Discount"),
                        leading: Icon(Icons.shopping_basket),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: myBox(),
                      child: ListTile(
                        onLongPress:(){ _showMyDialog("Changing of Money");},
                        title: Text("Changing"),
                        leading: Icon(Icons.attach_money),
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Changing())
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: myBox(),
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>Time())
                          );
                        },
                        onLongPress:(){ _showMyDialog("Time");},
                        title: Text("Time"),
                        leading: Icon(Icons.access_time),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: myBox(),
                      child: ListTile(
                        onLongPress:(){ _showMyDialog("Speed");},
                        title: Text("Speed"),
                        leading: Icon(Icons.directions_car),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      decoration: myBox(),
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Lenght())
                          );
                        },
                        onLongPress:(){ _showMyDialog("Length");},
                        title: Text("Length"),
                        leading: Icon(Icons.format_line_spacing),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 70,
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Temperature()),
                          );
                        },
                        onLongPress:(){ _showMyDialog("Temperature");},
                        title: Text("Temperature"),
                        leading: Icon(Icons.beach_access),
                      ),
                    ),
                  ],
                ),

          )
        ),
      ),
    );



  }

}