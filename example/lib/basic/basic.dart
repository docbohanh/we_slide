import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';

class Basic extends StatefulWidget {
  Basic({Key key}) : super(key: key);

  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 130.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    final _controller = WeSlideController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: WeSlide(
        parallax: true,
        hideAppBar: true,
        hideFooter: false,
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        backgroundColor: Colors.tealAccent,
        panelBorderRadiusBegin: 20.0,
        panelBorderRadiusEnd: 20.0,
        parallaxOffset: 0.3,
        appBarHeight: 80.0,
        footerHeight: 60.0,
        controller: _controller,
        appBar: AppBar(
          title: Text("We Slide"),
          leading: BackButton(),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.tealAccent,
          child: Center(child: Text("This is the body 💪")),
        ),
        panel: Container(
          color: _colorScheme.primary,
          child: Center(child: Text("This is the panel 😊")),
        ),
        panelHeader: GestureDetector(
          onTap: () {
            _controller.show();
          },
          child: Container(
            height: 90.0,
            color: _colorScheme.secondary,
            child: Center(child: Text("Slide to Up ☝️")),
          ),
        ),
        footer: Container(
          height: 60.0,
          color: Colors.orange,
          child: Center(child: Text("This is the footer ")),
        ),
      ),
    );
  }
}
