import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'miniplayer.dart';
import 'bottom_bar.dart';
import 'player.dart';
import 'home.dart';

class MusicApp extends StatefulWidget {
  MusicApp({Key key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  bool showMiniView = true;
  final WeSlideController _controller = WeSlideController();

  @override
  Widget build(BuildContext context) {
    final double _panelMinSize =
        kToolbarHeight * 2 + MediaQuery.of(context).padding.bottom;
    final double _panelMaxSize = MediaQuery.of(context).size.height;

    return Scaffold(
      body: WeSlide(
        controller: _controller,
        panelMinSize: showMiniView ? _panelMinSize : 0.0,
        panelMaxSize: _panelMaxSize,
        overlayOpacity: 0.9,
        overlay: true,
        body: Home(),
        panelHeader: MiniPlayer(onTap: _controller.show),
        panel: Player(onTap: _controller.hide),
        footer: BottomBar(),
        footerHeight: kToolbarHeight + MediaQuery.of(context).padding.bottom,
        appBarHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Music App', style: TextStyle(fontSize: 16)),
          actions: [
            IconButton(icon: Icon(Icons.slideshow), onPressed: () {
              print(showMiniView);
              showMiniView = !showMiniView;
              print(showMiniView);
              setState(() {});
            })
          ],
        ),
      ),
    );
  }
}
