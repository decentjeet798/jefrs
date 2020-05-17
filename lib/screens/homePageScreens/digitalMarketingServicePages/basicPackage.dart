import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../../widgets/appBar.dart';

class BasicPackage extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  final List basicPackage = [
    "10 Keywords Optimization",
    "4 Keywords Top 10 Guarantee*",
    "Initial Review & Analysis",
    "Website Analysis",
    "Content Duplicacy Check",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Basic Package"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: designPriceCard(
              context,
              "Basic Package",
              "\$ ",
              "249/mo",
              Color(0xFFFF4867),
              Color(0xFFFFA4B3),
              contactButtonOnCard(height),
            ),
          ),
          getListOf(height, basicPackage),
        ],
      ),
    );
  }
}
