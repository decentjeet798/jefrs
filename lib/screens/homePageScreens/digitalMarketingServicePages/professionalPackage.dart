import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/graphicDesignAndDigitalMarketingServiceMixin.dart';
import '../../../widgets/appBar.dart';

class ProfessionalPackage extends StatelessWidget
    with GraphicDesignAndDigitalMarketingServiceMixin {
  final List professionalPackage = [
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
      appBar: AppBars().appBar("Professional Package"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: designPriceCard(
              context,
              "Professional Package",
              "\$ ",
              "499/mo",
              Color(0xFF14B97E),
              Color(0xFF8ADCBF),
              contactButtonOnCard(height),
            ),
          ),
          getListOf(height, professionalPackage),
        ],
      ),
    );
  }
}
