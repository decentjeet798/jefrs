import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../widgets/appBar.dart';
import '../../config/responsive.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  InkWell contactIcons(
      {String text, IconData icon, Function onpressed, double height}) {
    return InkWell(
      onTap: onpressed,
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      autofocus: true,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xFF3B5999),
              size: SizeConfig.imageSizeMultiplier * 7,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Text(
              text,
              style: TextStyle(fontSize: height / 100 + 9),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBars().appBar("ContactUs"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(
              "assets/img/contactus.png",
            ),
            fit: BoxFit.cover,
            height: SizeConfig.imageSizeMultiplier * 60,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "We love hearing from all our customers!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: height / 100 + 12,
                fontFamily: 'Metropolis',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Text(
            "Check out our FAQs",
            style: TextStyle(
              fontSize: height / 100 + 10,
              fontFamily: 'Metropolis',
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Material(
              color: Color(0xFF3B5999),
              borderRadius: BorderRadius.circular(5),
              elevation: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                splashColor: Colors.white30,
                onTap: () {
                  // Navigate
                  print("View FAQs");
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 6,
                  child: Center(
                    child: Text(
                      "View FAQs",
                      style: TextStyle(
                        fontSize: height / 100 + 8,
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
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
                    height: 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Metropolis',
                    fontSize: height / 100 + 6,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
                    height: 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Text(
            "Contact with a live person 24/7",
            style: TextStyle(
              fontSize: height / 100 + 8,
              color: Colors.black87,
              fontFamily: 'Metropolis',
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              contactIcons(
                icon: FeatherIcons.phone,
                text: "Call",
                height: height,
                onpressed: () {
                  print("Phone");
                },
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 11,
              ),
              contactIcons(
                icon: FeatherIcons.messageCircle,
                text: "Chat",
                height: height,
                onpressed: () {
                  print("Chat");
                },
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 12,
              ),
              contactIcons(
                icon: Icons.alternate_email,
                text: "Email",
                height: height,
                onpressed: () {
                  print("Email");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
