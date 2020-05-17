import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../mixins/webViewDesignMixin.dart';
import '../../../widgets/appBar.dart';

class Price299DollarWebDesign extends StatelessWidget with WebViewDesignMixin {
  final List smallBusinessProcess = [
    "5 Pages",
    "Mobile Responsive",
    "Home Page Header Slideshow",
    "Clear CTAs(call-to-action)",
    "Live Chat Feature",
    "Instant Whatsapp Messaging",
    "Online Contact Form",
    "Online Blog / NEWS Module",
    "Photo Galleries",
    "Administration access to Add/Edit the website content",
    "SEO Optimized",
    "W3C Validated",
    "15 Day Free Maintenance",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Small Business"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 30,
            child: priceCardTemplate(
              context,
              "Small",
              299,
              Color(0xFFFF4867),
              Color(0xFFFFA4B3),
              contactButtonOnCard(height),
            ),
          ),
          getListOfBusineessProcess(height, smallBusinessProcess),
        ],
      ),
    );
  }
}
