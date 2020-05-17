import 'package:flutter/material.dart';
import 'package:jefrs_tech/config/styles.dart';

class AppBars {
  AppBars();

  bool enabled = true;
  bool isOpen = false;
  Brightness _brightness = Brightness.light;

  AppBar appBar(String title, [List<Widget> widget, PreferredSize bottom]) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      brightness: _brightness,
      backgroundColor: AppTheme.primaryColor,
      title: Text(
        title,
        style: TextStyle(color: Colors.black87),
      ),
      actions: widget,
      bottom: bottom,
    );
  }

  AppBar chatAppBar(String title, String subTitle, BuildContext context) {
    return AppBar(
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.black87),
      backgroundColor: Colors.white,
      brightness: _brightness,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      title: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Metropolis',
          ),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            color: Colors.grey,
            letterSpacing: 1,
            fontFamily: 'Metropolis',
          ),
        ),
      ),
    );
  }

  SliverAppBar homeAppBar(Function onTap, GlobalKey<ScaffoldState> drawerKey,context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.black87),
      brightness: _brightness,
      backgroundColor: AppTheme.primaryColor,
      pinned: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (enabled) {
            isOpen = false;
            onTap();
            drawerKey.currentState.openDrawer();
          }
        },
      ),
      title: Image(
        height: 90.0,
        image: AssetImage("assets/img/logo.png"),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed("/notification");
            },
          ),
        )
      ],
    );
  }

  AppBar fixedAppBar(Function onTap, GlobalKey<ScaffoldState> drawerKey) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black87),
      brightness: _brightness,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          if (enabled) {
            // open drawer if this value is true
            isOpen = false;
            onTap();
            drawerKey.currentState.openDrawer();
          }
        },
      ),
      title: Image(
        height: 90.0,
        image: AssetImage("assets/img/logo.png"),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.notifications),
        )
      ],
    );
  }
}
