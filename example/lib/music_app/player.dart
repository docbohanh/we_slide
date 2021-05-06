import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final Function onTap;

  Player({@required this.onTap});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  double sliderValue = 30.0;
  double musicTime = 156.0;

  String musicTimeDisplay(Duration d) {
    return d.toString().substring(2, 7); /// mm:ss
    // return d.toString().split('.').first.padLeft(8, "0"); /// HH:mm:ss
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cardSize = MediaQuery.of(context).size.width - kToolbarHeight * 2;
    return Material(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF57D780),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0B1220).withOpacity(0.0),
                    Color(0xFF0B1220).withOpacity(0.9)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height -
                        150 -
                        kToolbarHeight,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                                height: MediaQuery.of(context).padding.top),
                            // Header
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () => widget.onTap(),
                                    iconSize: 24,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "PLAYING NOW",
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.bodyText1
                                              .apply(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: cardSize,
                                width: cardSize,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6.0),
                                  ),
                                  child: Image.asset(
                                    r"assets/thumb/XVztg3oXmX4.jpg",
                                  ),
                                ),
                              ),
                            ),
                            // Music info
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          r"Wurkit (Original Mix)",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.headline5.apply(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Kyle Watson",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.headline6.apply(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 2,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 8,
                            ),
                          ),
                          child: Slider(
                            inactiveColor: Colors.white.withOpacity(0.1),
                            activeColor: Colors.white,
                            value: sliderValue,
                            min: 0.0,
                            max: musicTime,
                            onChanged: (double value) {
                              setState(() {
                                sliderValue = value;
                              });
                            },
                          ),
                        ),
                        //SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                musicTimeDisplay(Duration(seconds: sliderValue.toInt())),
                                style: textTheme.bodyText2.apply(
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              Text(
                                musicTimeDisplay(Duration(seconds: musicTime.toInt())),
                                style: textTheme.bodyText2.apply(
                                    color: Colors.white.withOpacity(0.7)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.repeat,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              IconButton(
                                iconSize: 32,
                                onPressed: () {},
                                icon: Icon(Icons.skip_previous,
                                    color: Colors.white),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Color(0xFF0B1220),
                                child: Icon(Icons.pause, size: 32),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                                elevation: 0.0,
                              ),
                              IconButton(
                                iconSize: 32,
                                onPressed: () {},
                                icon:
                                    Icon(Icons.skip_next, color: Colors.white),
                              ),
                              IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shuffle,
                                  color: Colors.white.withOpacity(
                                      0.4), //Theme.of(context).accentColor.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
