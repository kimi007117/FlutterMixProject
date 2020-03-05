import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/first_page.dart';
import 'package:flutter_module/redux/count_reducer.dart';
import 'package:flutter_module/redux/count_state.dart';
import 'package:flutter_module/second_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'simple_page_widgets.dart';

void main() {
  final store =
  Store<CountState>(reducer, initialState: CountState.initState());
  runApp(MyApp(store));
//  runApp(_widgetForRoute(window.defaultRouteName));
}



Widget _widgetForRoute(String route) {
  switch (route) {
    case 'first':
      return FirstPage();
    case 'second':
      return SecondPage();
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}






class MyApp extends StatefulWidget {

  final Store<CountState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'first': (pageName, params, _) => FirstRouteWidget(),
      'second': (pageName, params, _) => SecondRouteWidget(),
      'flutter://firstPage':(pageName, params, _) => FirstPage(),
      'flutter://secondPage':(pageName, params, _) => SecondPage(),

      'tab': (pageName, params, _) => TabRouteWidget(),
      'platformView': (pageName, params, _) => PlatformRouteWidget(),
      'flutterFragment': (pageName, params, _) => FragmentRouteWidget(params),
      ///可以在native层通过 getContainerParams 来传递参数
      'flutterPage': (pageName, params, _) {
        print("flutterPage params:$params");

        return FlutterRouteWidget(params:params);
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(store: widget.store,child: MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container()),);
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
  }
}