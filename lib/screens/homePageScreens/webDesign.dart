import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../config/styles.dart';
import '../../mixins/webViewDesignMixin.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bannerCard.dart';
import '../../Services/webDesignService.dart';

class WebDesign extends StatefulWidget {
  @override
  _WebDesignState createState() => _WebDesignState();
}

class _WebDesignState extends State<WebDesign> with WebViewDesignMixin {
  List webTiles(height) {
    return listOfWebDesignModel.map((i) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: new Border.all(width: 7.0, color: i.color),
            ),
            child: Center(
              child: Text(
                i.processNumber.toString(),
                style: TextStyle(
                  color: i.color,
                  fontFamily: "Metropolis",
                  fontSize: height + 10,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          title: Text(
            i.processName,
            style: TextStyle(
                color: i.color,
                fontSize: height + 12,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            i.processDesc,
          ),
          contentPadding: EdgeInsets.all(10),
        ),
      );
    }).toList();
  }

  Card delivered(height) {
    return Card(
      elevation: 8,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: new Border.all(
              width: 7.0,
              color: AppTheme.facebook,
            ),
          ),
          child: Center(
              child: Icon(
            Icons.web,
            color: AppTheme.facebook,
          )),
        ),
        title: Text(
          "DELIVERED",
          style: TextStyle(
            color: AppTheme.facebook,
            fontSize: height + 12,
            fontWeight: FontWeight.w900,
          ),
        ),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    List<GestureDetector> priceCard = [
      priceCardTemplate(
        context,
        "Small",
        299,
        Color(0xFFFF4867),
        Color(0xFFFFA4B3),
        viewMore(context, height),
        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        BorderRadius.circular(10),
        "/price299DollarWebDesign",
      ),
      priceCardTemplate(
        context,
        "Mid-Size",
        499,
        Color(0xFF14B97E),
        Color(0xFF8ADCBF),
        viewMore(context, height),
        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        BorderRadius.circular(10),
        "/price499DollarWebDesign",
      ),
      priceCardTemplate(
        context,
        "Large",
        699,
        Color(0xFFF9D86B),
        Color(0xFF7C6C35),
        viewMore(context, height),
        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        BorderRadius.circular(10),
        '/price699DollarWebDesign',
      ),
    ];

    return Scaffold(
      appBar: AppBars().appBar("Website Design/Development"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          CarouselSlider(
            items: priceCard,
            initialPage: 0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            autoPlayInterval: Duration(seconds: 5),
            pauseAutoPlayOnTouch: Duration(seconds: 5),
          ),
          BannerCard("Proces we follow"),
          Column(
            children: webTiles(height)..add(delivered(height)),
          )
        ],
      ),
    );
  }
}
