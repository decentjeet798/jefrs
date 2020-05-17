import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../config/responsive.dart';
import '../../config/styles.dart';
import '../../widgets/appBar.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars().appBar("About Us"),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image(
                  height: SizeConfig.imageSizeMultiplier * 60,
                  image: AssetImage("assets/img/logo.png"),
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 1,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(FeatherIcons.barChart2,
                            color: AppTheme.facebook),
                        title: Text("About Us"),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "A startup company is young companies are raised by an initial and unique idea by limited economic standards. Startup’s are developing products and services currently not available in the market. Startup’s initial handled by the founder or individual. Startup’s are operated by limited resources and conditional environments. Startup’s are a drawback in the lack of various knowledge and support."),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ListTile(
                        leading:
                            Icon(FeatherIcons.phone, color: AppTheme.facebook),
                        title: Text("+91 8880303333"),
                      ),
                      ListTile(
                        leading:
                            Icon(FeatherIcons.mail, color: AppTheme.facebook),
                        title: Text("tech@jefrs.com"),
                      ),
                      ListTile(
                        leading: Icon(FeatherIcons.calendar,
                            color: AppTheme.facebook),
                        title: Text("Company started from : 2014"),
                      ),
                      ListTile(
                        leading:
                            Icon(FeatherIcons.user, color: AppTheme.facebook),
                        title: Text("Proprietor name : Jafar Shareef"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
