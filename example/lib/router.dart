import 'package:flutter/material.dart';

import 'music_app/music_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyRouter {
  static const root = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      root: (ctx) => MusicApp(),
    };
    WidgetBuilder builder = routes[settings.name];

    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}


