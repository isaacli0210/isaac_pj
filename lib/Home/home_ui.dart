import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:isaac_pj/Admin/admin_ui.dart';
import 'package:isaac_pj/MoveIn/move_in_ui.dart';
import 'package:isaac_pj/MoveOut/move_out_ui.dart';
import 'package:isaac_pj/Preview/preview_ui.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin<Home> {

  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();
  final _bottomNavigationColor = Colors.blue;
  AnimationController _hide;

  @override
  void initState() {
    pages
      ..add(Admin())
      ..add(MoveIn())
      ..add(MoveOut())
      ..add(Preview());
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification.depth == 0) {
      if (scrollNotification is UserScrollNotification) {
        final UserScrollNotification userScroll = scrollNotification;

        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _bottomNavigationColor,),
          title: Text('Home', style: TextStyle(color: _bottomNavigationColor),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_download, color: _bottomNavigationColor,),
          title: Text('MoveIn', style: TextStyle(color: _bottomNavigationColor))
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_upload, color: _bottomNavigationColor),
          title: Text('MoveOut', style: TextStyle(color: _bottomNavigationColor))
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit, color: _bottomNavigationColor),
          title: Text('Preview', style: TextStyle(color: _bottomNavigationColor))
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final Orientation orientation = MediaQuery.of(context).orientation;

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: SizeTransition(
          sizeFactor: _hide,
          axisAlignment: -1.0,
          child: bottomNavigationBar(),
        ),
      ),
    );
  }
}
