import 'package:flutter/material.dart';
import '../config/responsive.dart';

class BannerCard extends StatelessWidget {
  final String bannerTitle;

  const BannerCard(this.bannerTitle);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    return Card(
     
     
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        height: SizeConfig.heightMultiplier * 8,
        alignment: Alignment.center,
        child: Text(
          bannerTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: height + 10,
            color: Colors.black87,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}
