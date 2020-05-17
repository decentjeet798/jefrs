import 'package:flutter/material.dart';

import '../../widgets/appBar.dart';
import '../../widgets/bannerCard.dart';
import '../../Services/mobileAppDevelopmentService.dart';

class MobilAppDesign extends StatelessWidget {
  List webTiles(height) {
    return mobileAppDevelopmentService.map((i) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: new Border.all(width: 7.0, color: i.color),
            ),
            child: Center(
              child: Icon(
                i.icon,
                color: i.color,
              ),
            ),
          ),
          title: Text(
            i.title,
            style: TextStyle(
              color: i.color,
              fontSize: height + 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            i.description,
          ),
          contentPadding: EdgeInsets.all(10),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Mobile App Design"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          BannerCard("Proces we follow"),
          Column(
            children: webTiles(height),
          )
        ],
      ),
    );
  }
}
