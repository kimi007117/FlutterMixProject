import 'package:flutter/material.dart';
import 'package:flutter_module/redux/count_state.dart';
import 'package:flutter_redux/flutter_redux.dart';


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('SecondPage'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: StoreConnector<CountState,int>(
            converter: (store) => store.state.count,
            builder: (context, count) {
              return Text(
                count.toString(),
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
