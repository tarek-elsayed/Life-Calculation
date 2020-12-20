import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discount extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Discount();
  }
}
class _Discount extends State<Discount>{

  final price=TextEditingController();
  double _price=0;
  final discount=TextEditingController();
  double _discount=0;
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
        title: Text("Discount"),
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
                Text(" Price : ",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),),
                Padding(padding: EdgeInsets.only(right: 65)),
                Container(
                  height: 60,
                  width: 150,
                  child: TextField(
                    controller: price,
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
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              children: <Widget>[
                Text(" Discount : ",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),),
                Padding(padding: EdgeInsets.only(right: 20)),
                Container(
                  height: 60,
                  width: 150,
                  child: TextField(
                    controller: discount,
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
                )
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
                      _price=double.parse(price.text);
                      _discount=double.parse(discount.text)/100;
                      result=double.parse((_price-(_price*_discount)).toStringAsFixed(1));

                    });
                  },
                  child: Text("Result",style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
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