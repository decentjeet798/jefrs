import 'package:flutter/material.dart';
import '../config/responsive.dart';
import '../config/styles.dart';

class WebViewDesignMixin {
  getListOfBusineessProcess(height, List businessProcess) {
    return Column(
      children: businessProcess.map((i) {
        return Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(
              Icons.done,
              color: Colors.green,
              // size: 50,
            ),
            title: Text(
              i,
              style: TextStyle(
                  fontFamily: 'Metropolis',
                  color: AppTheme.secondryColor,
                  fontSize: height + 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      }).toList(),
    );
  }

  GestureDetector priceCardTemplate(
    BuildContext context,
    String businessSize,
    int amount,
    Color bgColor,
    Color lineColor,
    Container action, [
    EdgeInsets margin,
    BorderRadius radius,
    String route,
  ]) {
    var height = MediaQuery.of(context).size.height / 100;
    return GestureDetector(
      onTap: () {
        route == null
            ? Navigator.of(context)
            : Navigator.of(context).pushNamed(route);
      },
      child: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: radius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "$businessSize Business \n",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      fontSize: height + 14,
                    ),
                  ),
                  TextSpan(
                    text: "Wordpress Website \n",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                      fontSize: height + 8,
                    ),
                  ),
                  TextSpan(
                    text: "Theme Based",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                      fontSize: height + 8,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 1),
              height: SizeConfig.heightMultiplier * 0.5,
              width: SizeConfig.widthMultiplier * 30,
              color: lineColor,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "\$ ",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.3,
                      fontSize: height + 20,
                    ),
                  ),
                  TextSpan(
                    text: "$amount* \n",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.3,
                      fontSize: height + 30,
                    ),
                  ),
                ],
              ),
            ),
            action,
          ],
        ),
      ),
    );
  }

  Container contactButtonOnCard(height) {
    return Container(
      width: SizeConfig.widthMultiplier * 30,
      child: Material(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          splashColor: Colors.transparent,
          onTap: () => print("More"),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            height: SizeConfig.heightMultiplier * 5,
            width: SizeConfig.widthMultiplier * 30,
            child: Center(
              child: Text(
                "Contact",
                style: TextStyle(
                  fontSize: height / 100 + 14,
                  color: Color(0xFF002240),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container viewMore(context, height) {
    return Container(
      width: double.infinity,
      height: SizeConfig.heightMultiplier * 4,
      color: Color(0xFF002240),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "View More",
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.3,
                  fontSize: height + 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
