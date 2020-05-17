import 'package:flutter/material.dart';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/responsive.dart';
import '../../config/styles.dart';
import '../../repository/signUpRepo.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  SignUpRepo provider;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await _prefs;
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignUpRepo>(context);
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderOnForeground: true,
          shadowColor: AppTheme.secondryColor,
          child: Container(
            width: double.infinity,
            height: SizeConfig.heightMultiplier * 60,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage("assets/img/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                Text(
                  "Hope we fulfilled your requirements \n Thank You!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height + 10,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Metropolis',
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 6),
                Material(
                  color: AppTheme.facebook,
                  borderRadius: BorderRadius.circular(5),
                  elevation: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    splashColor: Colors.white30,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: SizeConfig.heightMultiplier * 6,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FeatherIcons.logOut,
                              color: Colors.white,
                            ),
                            SizedBox(width: SizeConfig.widthMultiplier * 4),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: height + 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Metropolis',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Are you sure?",
                                style: TextStyle(
                                  color: AppTheme.facebook,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Metropolis',
                                )),
                            content: Text(
                              "By clicking on yes you will be logged out from the app",
                            ),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text("Yes",
                                      style: TextStyle(
                                        color: AppTheme.facebook,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Metropolis',
                                      )),
                                  onPressed: () async {
                                    provider.setUserLoggedIn(false);
                                    try {
                                      // signout code
                                      Navigator.of(context).pop();
                                      await FirebaseAuth.instance
                                          .signOut()
                                          .then((value) => {
                                                provider.setUserLoggedIn(false),
                                                prefs.setBool("userLoggedIn",
                                                    provider.getUserLoggedIn),
                                                prefs.remove("name"),
                                                prefs.remove("email")
                                              });
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  }),
                              FlatButton(
                                color: AppTheme.facebook,
                                child: Text("No",
                                    style: TextStyle(
                                      // fontSize: height + 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Metropolis',
                                    )),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
