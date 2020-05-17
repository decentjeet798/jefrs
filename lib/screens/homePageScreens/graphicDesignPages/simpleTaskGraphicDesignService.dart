import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../../widgets/appBar.dart';

class SimpleTaskGraphicDesignService extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  final List singleTaskSpec = [
    "Any One Task",
    "Upto 3 Design Concepts",
    "Upto 3 Revisions",
    "2 Business Days Delivery",
    "Any Graphic Design",
    "All Source Files Provided",
    "Upto Three A4 Double-Sided Page",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Single task"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: designPriceCard(
              context,
              "SINGLE TASK",
              "\u20B9 ",
              "4,900",
              Color(0xFFFF4867),
              Color(0xFFFFA4B3),
              contactButtonOnCard(height),
            ),
          ),
          getListOf(height, singleTaskSpec),
        ],
      ),
    );
  }
}
