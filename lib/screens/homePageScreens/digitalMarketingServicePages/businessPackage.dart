import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../../widgets/appBar.dart';

class BusinessPackage extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  final List businessPackage = [
    "25 Keywords Optimization",
    "15 Keywords Top 10 Guarantee*",
    "Initial Review & Analysis",
    "Website Analysis",
    "Content Duplicacy Check",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Business Package"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: designPriceCard(
              context,
              "Business Package",
              "\$ ",
              "499/mo",
              Color(0xFFF9D86B),
              Color(0xFF7C6C35),
              contactButtonOnCard(height),
            ),
          ),
          getListOf(height, businessPackage),
        ],
      ),
    );
  }
}
