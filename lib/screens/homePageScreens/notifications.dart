import 'package:flutter/material.dart';
import '../../config/styles.dart';
import '../../widgets/appBar.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Notification"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          buildNotification(height),
          buildNotification(height),
          buildNotification(height),
          buildNotification(height),
          buildNotification(height),
          buildNotification(height),
        ],
      ),
    );
  }

  Column buildNotification(double height) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.notifications_active,
            size: 35,
          ),
          title: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
            style: TextStyle(
                fontFamily: "Metropolis",
                fontSize: height + 6,
                fontWeight: FontWeight.w500,
                color: AppTheme.secondryColor),
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "24 Nov 19,4:30 PM",
              style: TextStyle(
                fontFamily: "Metropolis",
                fontSize: height + 5,
                color: AppTheme.secondryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
