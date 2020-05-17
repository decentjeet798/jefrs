import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../../widgets/appBar.dart';

class UnlimitedTaskGraphicDesignService extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  final List unlimitedTasksSpec = [
    "Unlimited Tasks",
    "Unlimited Concepts",
    "Unlimited Revisions",
    "2 Business Days Delivery",
    "All Kinds of Graphic Designs",
    "All Source Files Provided",
    "Unlimited Brands",
    "Great for Startups, Businesses",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Unlimited task"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: designPriceCard(
              context,
              "UNLIMITED TASKS",
              "\u20B9 ",
              "24,900/mo",
              Color(0xFF14B97E),
              Color(0xFF8ADCBF),
              contactButtonOnCard(height),
            ),
          ),
          getListOf(height, unlimitedTasksSpec),
        ],
      ),
    );
  }
}
