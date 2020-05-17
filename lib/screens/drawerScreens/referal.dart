import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../widgets/dashedRect.dart';
import '../../config/styles.dart';
import '../../config/textStyles.dart';
import '../../config/responsive.dart';
import '../../utils/formatters.dart';
import '../../widgets/appBar.dart';

class Referal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Expanded line() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 2,
          ),
          height: 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
      );
    }

    SizedBox h1point5() {
      return SizedBox(
        height: SizeConfig.heightMultiplier * 1.5,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars().appBar("Referal"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Text(
                  "Invite friend and get rewards",
                  style: TextStyle(
                    fontSize: height / 100 + 10,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image(
                  image: AssetImage(
                    "assets/img/referal.png",
                  ),
                  fit: BoxFit.cover,
                  height: SizeConfig.imageSizeMultiplier * 60,
                  alignment: Alignment.center,
                ),
              /*  Text(
                  "YOUR REFERAL CODE",
                  style: TextStyle(
                    fontSize: height / 100 + 12,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                  ),
                ),*/
                h1point5(),
                /*DashedRect(
                  color: Colors.grey,
                  gap: 3.5,
                  strokeWidth: 2,
                  // borderType: BorderType.RRect,
                  // radius: Radius.circular(5),
                  // padding: EdgeInsets.all(6),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Container(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 60,
                        color: Colors.grey.withOpacity(0.4),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [UpperCaseTextFormatters()],
                          cursorColor: AppTheme.facebook,
                          textAlign: TextAlign.center,
                          style: TextStyles.referalCodeTextStyle,
                          cursorWidth: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "RS0KOP3",
                            hintStyle: TextStyles.referalCodeTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),*/

                h1point5(),
                h1point5(),
                h1point5(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2,
                  ),
                  child: Material(
                    color: AppTheme.facebook,
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      splashColor: Colors.white30,
                      onTap: () => print("Refer Friends"),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: SizeConfig.heightMultiplier * 6,
                        child: Center(
                          child: Text(
                            "Refer Friends",
                            style: TextStyle(
                              fontSize: height / 100 + 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Metropolis',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                h1point5(),
                h1point5(),
                h1point5(),
                /*Row(
                  children: <Widget>[
                    line(),
                    Text(
                      "Your Referal Earnings",
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: height / 100 + 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    line(),
                  ],
                ),
                */

                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 2,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        h1point5(),
                        h1point5(),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\u20B9" + " " + "2",
                                  style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    fontSize: height / 100 + 30,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.facebook,
                                  ),
                                ),
                                TextSpan(text: "\n"),
                                TextSpan(
                                  text: "Total Referal Earnings",
                                  style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    fontSize: height / 100 + 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.3,
                                    color: AppTheme.facebook,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        h1point5(),
                        h1point5(),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.secondryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FeatherIcons.alertCircle,
                                  color: AppTheme.secondryColor,
                                  size: SizeConfig.heightMultiplier * 3.5,
                                ),
                                Text(
                                  " NOTE : ",
                                  style: TextStyle(
                                    color: AppTheme.secondryColor,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Metropolis',
                                    fontSize: height / 100 + 3.5,
                                  ),
                                ),
                                Text(
                                  "Only Referals from August 1st will be shown",
                                  style: TextStyle(
                                    color: AppTheme.secondryColor,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Metropolis',
                                    fontSize: height / 100 + 3.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
