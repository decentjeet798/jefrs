import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Models/userModel.dart';
import '../../config/responsive.dart';
import '../../config/styles.dart';
import '../../repository/signUpRepo.dart';
import '../../screens/navBarScreens/otp.dart';
import '../../utils/textValidators.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bannerCard.dart';
import '../../mixins/InputFieldsMixinAndSnackBar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
String vid;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with InputFieldsMixinAndSnackBar {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextValidators textValidators = TextValidators();
  TextEditingController _phoneEditingController = TextEditingController();

  UserModel user;
  String phone = "";
  bool otpArrived = false;
  bool isEmailIDSelected = false;
  Future<bool> usr;
  String verificationId = "";

  var _currentCountryCode = 'IN +91';
  var _countryCode = [
    'IN +91',
    'IT +39',
    'XA +90',
    'ZA +41',
    'IT +33',
    'ZQ +67',
    'FA +98',
    'UR +81',
    'QT +89',
    'FS +90',
    'QQ +00',
  ];

  DropdownButtonHideUnderline buildDropdownButton(height) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        elevation: 0,
        style: TextStyle(
            fontFamily: 'Metropolis',
            color: AppTheme.secondryColor,
            fontSize: height + 10),
        items: _countryCode.map((String code) {
          return DropdownMenuItem<String>(
            value: code,
            child: Row(
              children: <Widget>[
                Icon(
                  FeatherIcons.flag,
                  color: AppTheme.facebook,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  code,
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    color: AppTheme.secondryColor,
                    fontSize: height + 10,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (String newValueCountryCodeSelected) {
          setState(() {
            _currentCountryCode = newValueCountryCodeSelected;
          });
        },
        value: _currentCountryCode,
      ),
    );
  }

  Future<void> verifyPhone(UserModel user) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String vID) {
      vid = vID;
      print(this.verificationId);
      print("you");
    };

    final PhoneCodeSent smsCodeSent = (String vID, [int forceResendingToken]) {
      // signInwithPhoneNumberAndGetUser(otpTextFromPage);
      this.setState(() {
        this.otpArrived = true;
        this.verificationId = vID;
      });
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {};

    final PhoneVerificationFailed verificationFailed =
        (AuthException exception) async {
      print("exception => ${exception.message}");
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          elevation: 6,
          backgroundColor: Colors.black87,
          behavior: SnackBarBehavior.floating,
          content: Container(
            child: Text(
              exception.message,
              style: TextStyle(fontFamily: 'Metropolis', color: Colors.white),
            ),
          ),
        ),
      );
    };

    await FirebaseAuth.instance
        .verifyPhoneNumber(
      phoneNumber: user.phone,
      timeout: Duration(seconds: 10),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verificationFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrive,
    )
        .catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / 100;
    var provider = Provider.of<SignUpRepo>(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBars().appBar("Sign In"),
      body: !this.otpArrived
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  //SIGN IN
                  BannerCard("Few Steps Ahead\nPlease Sign-In To Proceed"),
                  Card(
                    shadowColor: AppTheme.facebook,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //CountryCode
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppTheme.facebook),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: buildDropdownButton(height),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            //Phone Number
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _phoneEditingController,
                              decoration: buildInputDecoration(
                                hintText: "Phone",
                                helperText: "Ex: 9012345678",
                                prefixIcon: Icons.phone,
                              ),
                              validator: (String phoneValue) => textValidators
                                  .validatePhoneNumber(phoneValue),
                              onSaved: (String phoneValue) =>
                                  phone = phoneValue,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            Material(
                              color: AppTheme.facebook,
                              borderRadius: BorderRadius.circular(5),
                              elevation: 2,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                splashColor: Colors.white30,
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    List _phoneCode =
                                        _currentCountryCode.split(" ");

                                    user = UserModel(
                                      phone: _phoneCode[1] +
                                          _phoneEditingController.text.trim(),
                                    );
                                    showSnackBarWithLoadingIndicatorAndText(
                                      scaffoldKey,
                                      "Please Wait",
                                    );

                                    Future<bool> checkUserInDB =
                                        provider.checkUserInDB(user);
                                    if (await checkUserInDB) {
                                      showSnackBarWithIconAndText(
                                        scaffoldKey,
                                        "User Not Registered Please Sign-Up",
                                      );
                                    } else {
                                      showSnackBarWithLoadingIndicatorAndText(
                                        scaffoldKey,
                                        "Sending OTP",
                                      );
                                      this.verifyPhone(user);
                                    }
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.all(
                                      SizeConfig.heightMultiplier * 1),
                                  height: SizeConfig.heightMultiplier * 5,
                                  child: Center(
                                    child: Text(
                                      "Send OTP",
                                      style: TextStyle(
                                        fontSize: height + 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Metropolis',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New to JEFRs? ",
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: height + 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.setSelectedIndex(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign-up",
                            style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: height + 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          : OTPCode(
              userfromSignIn: user,
              verificationId: this.verificationId,
              comingFrom: "sign_in",
            ),
    );
  }
}
