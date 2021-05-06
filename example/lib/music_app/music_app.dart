import 'package:example/music_app/home.dart';
import 'package:example/music_app/personal.dart';
import 'package:example/nested_route.dart';
import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'miniplayer.dart';
import 'bottom_bar.dart';
import 'player.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({Key key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  bool showMiniView = true;
  final WeSlideController _controller = WeSlideController();
  int _bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double _panelMinSize =
        kToolbarHeight * 2 + MediaQuery.of(context).padding.bottom;
    final double _panelMaxSize = MediaQuery.of(context).size.height;

    buiBody(int index) {
      switch (index) {
        case 1:
          return PersonNested();
          break;
        default:
          return HomeNested();
      }
    }

    return Scaffold(
      body: WeSlide(
        controller: _controller,
        panelMinSize: showMiniView ? _panelMinSize : 0.0,
        panelMaxSize: _panelMaxSize,
        overlayOpacity: 0.9,
        overlay: true,
        body: buiBody(_bottomIndex),
        panelHeader: MiniPlayer(
          onTap: _controller.show,
          onLike: () {
            print('HEART');
          },
          onPlayOrPause: () => print('PLAY'),
        ),
        panel: Player(onTap: _controller.hide),
        footer: BottomBar(
          onTap: (index) => setState(() => _bottomIndex = index),
        ),
        footerHeight: kToolbarHeight + MediaQuery.of(context).padding.bottom,
        appBarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
      ),
    );
  }
}