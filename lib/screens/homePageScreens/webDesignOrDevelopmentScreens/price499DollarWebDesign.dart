import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/webViewDesignMixin.dart';
import '../../../widgets/appBar.dart';

class Price499DollarWebDesign extends StatelessWidget with WebViewDesignMixin {
  final List midSizeBusinessProcess = [
    "Everything in Small Business Package",
    "Up to 10 Pages",
    "Custom Home Page",
    "Custom designed content pages and styles",
    "Social network integration",
    "Speed Optimization",
    "Seo Friendly Urls/Clean Urls",
    "Google Map on Contact page"
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Mid-Size Business"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: priceCardTemplate(
                context,
                "Mid-Size",
                499,
                Color(0xFF14B97E),
                Color(0xFF8ADCBF),
                contactButtonOnCard(height)),
          ),
          getListOfBusineessProcess(height, midSizeBusinessProcess),
        ],
      ),
    );
  }
}
