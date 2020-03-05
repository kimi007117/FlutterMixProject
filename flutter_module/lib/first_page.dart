import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/redux/count_action.dart' as action;
import 'package:flutter_module/redux/count_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FirstPage extends StatelessWidget {
  final String channelName = "com.zcm/demo";

  Future<Null> jumpToNativePage() async {
    MethodChannel methodChannel = MethodChannel(channelName);
    await methodChannel.invokeMethod("native//:nativePage");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('FirstPage'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: <Widget>[
              Text(
                'FirstPage',
              ),
              RaisedButton(
                child: Text('To Native Page'),
                onPressed: () {
                  print("To Native Page");
                  jumpToNativePage();
                },
              ),
              StoreConnector<CountState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(action.Action.increment);
                },
                builder: (context, callback) {
                  return RaisedButton(
                    onPressed: callback,
                    child: Text('redux'),
                  );
                },
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
