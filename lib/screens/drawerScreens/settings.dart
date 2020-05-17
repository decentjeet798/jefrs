import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/responsive.dart';
import '../../config/styles.dart';
import '../../widgets/appBar.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = "";
  String email = "";
  String phone = "";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await _prefs;
    this.name = prefs.getString("name");
    this.email = prefs.getString("email");
    this.phone = prefs.getString("phone");
    this.setState(() {});
  }

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;

    ListTile profileList(String title, String data) {
      return ListTile(
        leading: Text(
          title,
          style: TextStyle(
            color: AppTheme.secondryColor,
            fontSize: height + 8,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          data,
          style: TextStyle(
            color: AppTheme.secondryColor,
            fontSize: height + 8,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBars().appBar("Settings"),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              ListTile(
                title: Text(
                  name,
                  style: TextStyle(
                    color: AppTheme.facebook,
                    fontSize: height + 20,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(
                    color: AppTheme.secondryColor,
                    fontSize: height + 8,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: CircleAvatar(
                  // backgroundColor: AppTheme.facebook,
                  backgroundImage: AssetImage("assets/img/defaultProfile.png"),
                  backgroundColor: Colors.white,
                  // maxRadius: 35,
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                elevation: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          FeatherIcons.user,
                          color: AppTheme.facebook,
                          size: SizeConfig.imageSizeMultiplier * 8,
                        ),
                        title: Text(
                          "Profile settings",
                          style: TextStyle(
                            color: AppTheme.secondryColor,
                            fontSize: height + 12,
                            fontFamily: 'Metropolis',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: FlatButton(
                          onPressed: () {},
                          child: Icon(
                            FeatherIcons.edit3,
                            color: AppTheme.facebook,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      profileList("Full Name", name != null ? name : ""),
                      profileList("Email", email != null ? email : ""),
                      profileList("Phone", phone != null ? phone : ""),
                      profileList("Address", "XYZ @91 street view"),
                      profileList("About", "Bio"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
