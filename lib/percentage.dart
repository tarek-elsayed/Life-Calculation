import 'package:flutter/material.dart';


class Percentage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Percentage();
  }
}
class _Percentage extends State<Percentage>{
  final value=TextEditingController();
  double _value=0;
  final per=TextEditingController();
  double _per=0;
  double result=0;


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
        title: Text("Percentage"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:()=> Navigator.of(context).pop()
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Value",
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
                ),
                Padding(padding: EdgeInsets.only(right: 124)),
                Container(
                  height: 60,
                  width: 150,
                  child:TextField(
                    controller: value,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      )
                    ),
                    keyboardType: TextInputType.number,
                  ) ,
                ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Percentage %",
                  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 20)),
                Container(
                  height: 60,
                  width: 150,
                  child:TextField(
                    controller: per,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ) ,
                ),
                SizedBox(height: 20,)
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
                      _value=double.parse(value.text);
                      _per=double.parse(per.text);
                      result=double.parse(((_value/_per)).toStringAsFixed(1));
                    });
                  },
                  child: Text("Result",style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            Text("Price=$result ",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}