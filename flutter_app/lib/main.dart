

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Main',
    routes: {
      '/Main': (context) => MainApp(),
      ExtractArgumentScreen.routeName: (context) => ExtractArgumentScreen()
    },
    title: "navigation",
  ));
}


class ScreenArguments{
  final String title;
  final String msg;

  ScreenArguments(this.title,this.msg);
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Screen'),
        ),
        body: Center(
          child: new GestureDetector(
            onTap: (){

              Navigator.pushNamed(context, ExtractArgumentScreen.routeName,arguments: ScreenArguments('navigation status','navigation success'));
            },
            child: new Text("onpress"),
          ),
        )
    );
  }
}



class ExtractArgumentScreen extends StatelessWidget{
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context){
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.msg),
      ),
    );
  }
}


