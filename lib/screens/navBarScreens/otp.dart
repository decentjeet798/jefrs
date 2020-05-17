import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/userModel.dart';
import '../../config/styles.dart';
import '../../mixins/InputFieldsMixinAndSnackBar.dart';
import '../../repository/signUpRepo.dart';
import '../../widgets/bannerCard.dart';
import '../../config/responsive.dart';

class OTPCode extends StatefulWidget {
  final UserModel userfromSignUp;
  final UserModel userfromSignIn;
  final String verificationId;
  final String comingFrom;

  OTPCode(
      {this.userfromSignUp,
      this.userfromSignIn,
      this.verificationId,
      this.comingFrom});
  @override
  _OTPCodeState createState() => _OTPCodeState();
}

class _OTPCodeState extends State<OTPCode> with InputFieldsMixinAndSnackBar {
  String otpCode;
  String verificationId;
  bool showLoader = true;
  FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  signInwithPhoneNumberAndGetUser(SignUpRepo provider) async {
    try {
      AuthCredential credential = PhoneAuthProvider.getCredential(
        smsCode: this.otpCode,
        verificationId: widget.verificationId,
      );

      FirebaseUser firebaseUser =
          (await _firebaseAuthInstance.signInWithCredential(credential)).user;

      print(firebaseUser.uid);
      this.setState(() {
        showLoader = true;
      });
      provider.setUserLoggedIn(true);
      if (widget.comingFrom == "sign_in") {
        prefs.setBool("userLoggedIn", provider.getUserLoggedIn);
        DocumentSnapshot userData = await Firestore.instance
            .collection("jefrs-users")
            .document(firebaseUser.uid)
            .get();
        print("EMAIL ===> ${userData.data["email"]}");
        prefs.setString("email", userData.data["email"]);

        print("PHONE ===> ${userData.data["phone"]}");
        prefs.setString("phone", userData.data["phone"]);

        prefs.setString("name",
            userData.data["firstName"] + " " + userData.data["lastName"]);

        provider.selectedIndexTab = 0;
      } else {
        prefs.setBool("userLoggedIn", provider.getUserLoggedIn);
        prefs.setString("email", widget.userfromSignUp.email);
        prefs.setString(
            "name",
            widget.userfromSignUp.firstName +
                " " +
                widget.userfromSignUp.lastName);
        prefs.setString("phone", widget.userfromSignUp.phone);
        await Firestore.instance
            .collection("jefrs-users")
            .document(firebaseUser.uid)
            .setData({
          "email": widget.userfromSignUp.email,
          "phone": widget.userfromSignUp.phone,
          "firstName": widget.userfromSignUp.firstName,
          "lastName": widget.userfromSignUp.lastName,
          "countryCode": widget.userfromSignUp.countryCode
        });
      }

      provider.setSelectedIndex(0);
    } catch (e) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: AppTheme.facebook,
        content: Text(
          e.message,
          style: TextStyle(
            fontFamily: 'Metropolis',
            color: Colors.white,
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignUpRepo>(context);
    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      key: scaffoldKey,
      body: showLoader
          ? SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  children: <Widget>[
                    BannerCard("Please enter OTP to proceed"),
                    SizedBox(
                      height: 50,
                    ),
                    PinCodeTextField(
                      length: 6,
                      obsecureText: false,
                      animationType: AnimationType.slide,
                      shape: PinCodeFieldShape.box,
                      animationDuration: Duration(milliseconds: 300),
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      animationCurve: Curves.easeIn,
                      autoFocus: true,
                      affirmativeText: "paste",
                      selectedColor: AppTheme.secondryColor,
                      inactiveColor: AppTheme.facebook,
                      activeColor: AppTheme.facebook,
                      activeFillColor: AppTheme.facebook,
                      dialogContent: "Do you want to paste OTP?\n",
                      dialogTitle: "Jefrs-Tech",
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                Text(
                                  "Verify OTP",
                                  style: TextStyle(
                                    fontSize: height + 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Metropolis',
                                  ),
                                ),
                                SizedBox(width: SizeConfig.widthMultiplier * 4),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          print("OTP CODE ======> $otpCode");
                          if (otpCode.length == 6) {
                            this.setState(() {
                              showLoader = false;
                            });
                            this.signInwithPhoneNumberAndGetUser(provider);
                          } else {
                            showSnackBarWithIconAndText(
                              scaffoldKey,
                              "OTP must be 6 characters",
                            );
                          }
                        },
                      ),
                    ),
                    // RaisedButton(
                    //   onPressed: ,
                    //   color: AppTheme.facebook,
                    //   child: Text(
                    //     "Verify OTP",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(AppTheme.facebook),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Loading ..",
                    style: TextStyle(
                      color: AppTheme.secondryColor,
                      fontFamily: 'Metropolis',
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

// mixin HEAD {}
