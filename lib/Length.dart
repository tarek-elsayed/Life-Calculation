import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Lenght extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lenght();
  }

}
class _Lenght extends State<Lenght>{
  
  BoxDecoration myBox() {
    return BoxDecoration(
      border: Border.all(
          width: 2,
          color: Colors.black
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }
  var _current=['Select','Kilometer','Mile','Meter'];
  var _currentSelect='Select';
  var _currentSelect1='Select';
  double result=0;
  final value=new TextEditingController();
  double _value=0;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("Length"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:()=> Navigator.of(context).pop()
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Select Frist Length",
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
                  child:TextField(
                    controller: value,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 2,color: Colors.black),
                      ),
                    ),
                    keyboardType:TextInputType.number,
                  ) ,
                ),
                Padding(padding: EdgeInsets.only(right: 45)),
                Container(
                  child: DropdownButton<String>(
                    style: TextStyle(fontSize: 22.5,color: Colors.black),
                    items: _current.map((String dorp){
                      return DropdownMenuItem<String>(
                          child: Text(dorp),
                        value: dorp,
                      );
                    }).toList(),
                    onChanged: (String newValue){
                      setState(() {
                        this._currentSelect=newValue;
                      });
                    },
                    value: _currentSelect,
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Row(
              children: <Widget>[
                Text("Select Second Length",
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
                  child:DropdownButton<String>(
                    style: TextStyle(fontSize: 22.5,color: Colors.black),
                      items:_current.map((String drop){
                        return DropdownMenuItem(
                          child: Text(drop),
                          value: drop,
                        );
                      }).toList(), 
                      onChanged: (String newVlaue){
                        setState(() {
                          this._currentSelect1=newVlaue;
                        });
                      },
                      value: _currentSelect1,
                  ) ,
                ),
                Padding(padding: EdgeInsets.only(right: 65)),
                Text("$result",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                height: 40,
                decoration: myBox(),
                child: FlatButton(
                  child: Text('Convert',style: TextStyle(color: Colors.black),),
                  onPressed: (){
                    setState(() {
                      _value=double.parse(value.text);
                      switch(_currentSelect){
                        case('Kilometer'):
                          {
                            switch(_currentSelect1){
                              case('Kilometer'):
                                {
                                  result = double.parse((_value).toStringAsFixed(4));
                                }break;
                              case('Mile'):
                                {
                                  result=double.parse((_value*0.621).toStringAsFixed(1));
                                }break;
                              case('Meter'):
                                {
                                  result=double.parse((_value*1000).toStringAsFixed(1));
                                }break;

                            }
                          }break;
                        case('Mile'):
                          {
                            switch(_currentSelect1){
                              case('Kilometer'):
                                {
                                  result = double.parse((_value/0.621).toStringAsFixed(4));
                                }break;
                              case('Mile'):
                                {
                                  result=double.parse((_value).toStringAsFixed(1));
                                }break;
                              case('Meter'):
                                {
                                  result=double.parse((_value*1609.344).toStringAsFixed(1));
                                }break;

                            }
                          }break;
                        case('Meter'):
                          {
                            switch(_currentSelect1){
                              case('Kilometer'):
                                {
                                  result = double.parse((_value/1000).toStringAsFixed(4));
                                }break;
                              case('Mile'):
                                {
                                  result=double.parse((_value/1609.344).toStringAsFixed(1));
                                }break;
                              case('Meter'):
                                {
                                  result=double.parse((_value).toStringAsFixed(1));
                                }break;

                            }
                          }break;
                          default:{result=0;}
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}