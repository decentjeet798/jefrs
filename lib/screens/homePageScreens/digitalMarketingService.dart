import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Services/digitalMarketingService.dart';
import '../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../widgets/bannerCard.dart';
import '../../widgets/appBar.dart';

class DigitalMarketingService extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  List graphicTiles(height) {
    return digitalMarketingList.map((i) {
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
              child: Icon(
                i.icon,
                color: i.color,
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    List<GestureDetector> priceCard = [
      designPriceCard(
        context,
        "Basic Package",
        "\$ ",
        "249/mo",
        Color(0xFFFF4867),
        Color(0xFFFFA4B3),
        viewMore(context, height),
        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        BorderRadius.circular(10),
        "/basicPackage",
      ),
      designPriceCard(
        context,
        "Professional Package",
        "\$ ",
        "499/mo",
        Color(0xFF14B97E),
        Color(0xFF8ADCBF),
        viewMore(context, height),
        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        BorderRadius.circular(10),
        "/professionalPackage",
      ),
      designPriceCard(
        context,
        "Business Package",
        "\$ ",
        "499/mo",
        Color(0xFFF9D86B),
        Color(0xFF7C6C35),
        viewMore(context, height),
        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        BorderRadius.circular(10),
        "/businessPackage",
      ),
    ];

    return Scaffold(
      appBar: AppBars().appBar("Digital Marketing Service"),
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
            children: graphicTiles(height),
          )
        ],
      ),
    );
  }
}
