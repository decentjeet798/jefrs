import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/webViewDesignMixin.dart';
import '../../../widgets/appBar.dart';

class Price699DollarWebDesign extends StatelessWidget with WebViewDesignMixin {
  final List largeBusinessProcess = [
    "Everything in Mid-Size Business Package",
    "up to 15 Pages",
    "Custom jQuery/Animation",
    "Booking/Scheduling solution",
    "Free Basic On page SEO",
    "Multi lingual support - Two initial languages, links to change language",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Large Business"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: priceCardTemplate(
              context,
              "Large",
              699,
              Color(0xFFF9D86B),
              Color(0xFF7C6C35),
              contactButtonOnCard(height),
            ),
          ),
          getListOfBusineessProcess(height, largeBusinessProcess),
        ],
      ),
    );
  }
}
