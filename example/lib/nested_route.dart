
import 'package:example/music_app/home.dart';
import 'package:flutter/material.dart';

import 'music_app/personal.dart';
import 'music_app/song_detail.dart';

///
final homeNestedKey = GlobalKey<NavigatorState>();

class HomeNestedRoute {
  static const home = '/home';
  static const songDetail = '/song-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      home: (ctx) => Home(),
      songDetail: (ctx) => SongDetail(song: settings.arguments),
    };
    WidgetBuilder builder = routes[settings.name];

    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

///
final personNestedKey = GlobalKey<NavigatorState>();

class PersonNestedRoute {
  static const personal = '/personal';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      personal: (ctx) => Personal(),
    };
    WidgetBuilder builder = routes[settings.name];

    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}