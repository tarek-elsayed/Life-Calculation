import 'package:flutter/material.dart';


class Time extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Time();
  }

}
class _Time extends State<Time>{
  BoxDecoration myBox() {
    return BoxDecoration(
      border: Border.all(
          width: 2,
          color: Colors.black
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }

  var _current=['Select','Year','Month','Week','Day'];
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
        title: Text("Time"),
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
                  Text("Select Frist Time",
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
                    child: DropdownButton<String>(
                      style: TextStyle(fontSize: 22.5,color: Colors.black),
                      items: _current.map((String drop){
                        return DropdownMenuItem<String>(
                          value: drop,
                          child: Text(drop),
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
                  Text("Select Second Time",
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
                        items: _current.map((String drop){
                          return DropdownMenuItem(
                              child: Text(drop),
                            value: drop,
                          );
                        }).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            this._currentSelect1=newValue;
                          });
                        },
                      value:_currentSelect1 ,
                    ),
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

                      child: Text("Convert",style: TextStyle(color: Colors.black),),
                      onPressed: (){
                        setState(() {
                          _value=double.parse(value.text);
                          switch(_currentSelect){
                            case('Year'):
                              {
                                switch(_currentSelect1){
                                  case('Year'):
                                    {
                                      result = double.parse((_value).toStringAsFixed(4));
                                    }break;
                                  case('Month'):
                                    {
                                      result=double.parse((_value*12).toStringAsFixed(1));
                                    }break;
                                  case('Week'):
                                    {
                                      result=double.parse((_value*52.1428571).toStringAsFixed(1));
                                    }break;
                                  case('Day'):
                                    {
                                      result=double.parse((_value*365).toStringAsFixed(1));
                                    }break;
                                }
                              }break;
                            case('Month'):
                              {
                                switch(_currentSelect1){
                                  case('Year'):
                                    {
                                      result = double.parse((_value/12).toStringAsFixed(4));
                                    }break;
                                  case('Month'):
                                    {
                                      result=double.parse((_value).toStringAsFixed(1));
                                    }break;
                                  case('Week'):
                                    {
                                      result=double.parse((_value*4).toStringAsFixed(1));
                                    }break;
                                  case('Day'):
                                    {
                                      result=double.parse((_value*30).toStringAsFixed(1));
                                    }break;
                                }
                              }break;
                            case('Week'):
                              {
                                switch(_currentSelect1){
                                  case('Year'):
                                    {
                                      result = double.parse((_value/52.1428571).toStringAsFixed(4));
                                    }break;
                                  case('Month'):
                                    {
                                      result=double.parse((_value/4).toStringAsFixed(1));
                                    }break;
                                  case('Week'):
                                    {
                                      result=double.parse((_value).toStringAsFixed(1));
                                    }break;
                                  case('Day'):
                                    {
                                      result=double.parse((_value*7).toStringAsFixed(1));
                                    }break;
                                }
                              }break;
                            case('Day'):
                              {
                                switch(_currentSelect1){
                                  case('Year'):
                                    {
                                      result = double.parse((_value/365).toStringAsFixed(4));
                                    }break;
                                  case('Month'):
                                    {
                                      result=double.parse((_value/30).toStringAsFixed(1));
                                    }break;
                                  case('Week'):
                                    {
                                      result=double.parse((_value/4).toStringAsFixed(1));
                                    }break;
                                  case('Day'):
                                    {
                                      result=double.parse((_value).toStringAsFixed(1));
                                    }break;
                                }
                              }break;
                              default:{result=0;}

                          }
                        });
                      },
                    )
                ),
              )
            ]
        ),
      ),
    );
  }

}