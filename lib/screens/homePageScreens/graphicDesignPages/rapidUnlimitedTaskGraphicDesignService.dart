import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../../widgets/appBar.dart';

class RapidUnlimitedTaskGraphicDesignService extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  final List rapidUnlimitedTasksSpec = [
    "Unlimited Tasks",
    "Unlimited Concepts",
    "Unlimited Revisions",
    "1 Business Day Delivery",
    "All Kinds of Graphic Designs",
    "All Source Files Provided",
    "Unlimited Brands",
    "Dedicated Design Team",
    "Great for Agencies",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Rapid unlimited task"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: designPriceCard(
              context,
              "RAPID UNLIMITED TASKS",
              "\u20B9 ",
              "4,4900/mo",
              Color(0xFFF9D86B),
              Color(0xFF7C6C35),
              contactButtonOnCard(height),
            ),
          ),
          getListOf(height, rapidUnlimitedTasksSpec),
        ],
      ),
    );
  }
}
