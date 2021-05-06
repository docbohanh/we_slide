import 'package:example/music_app/song_detail.dart';
import 'package:example/router.dart';
import 'package:example/store_app/store_app.dart';
import 'package:flutter/material.dart';

import 'basic/basic.dart';
//import 'store_app/store_app.dart';
//import 'music_app/music_app.dart';
import 'music_app/music_app.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      title: 'WeSlide Demo',
      debugShowCheckedModeBanner: false,
      key: navigatorKey,
      initialRoute: MyRouter.root,
      onGenerateRoute: MyRouter.generateRoute,
      // home: StoreApp(),
      // home: Basic(),
    );
  }
}