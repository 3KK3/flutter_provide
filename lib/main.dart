import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'counter.dart';

void main() {
  var counter = Counter();
  var provides = Providers();
  provides..provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(child: MyApp(), providers: provides,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 300,
            child: Column(
              children: <Widget>[
                MyButton(),
                Container(
                  height: 100,
                ),
                Number(),

              ],
            ),

          )

        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Provide<Counter>(builder: (context, child, counter){
        return Text("${counter.value}",style: TextStyle(color: Colors.red,),textAlign: TextAlign.center,);
      },),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
