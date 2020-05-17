import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with InputFieldsMixinAndSnackBar {
  //Form Related
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextValidators textValidators = TextValidators();
  TextEditingController _firstNameEditingController = TextEditingController();
  TextEditingController _lastNameEditingController = TextEditingController();
  TextEditingController _emailIdEditingController = TextEditingController();
  TextEditingController _phoneNumberEditingController = TextEditingController();
  UserModel user;
  bool otpArrived = false;
  int refreshToken;

  String firstName = "";
  String lastName = "";
  String emailId = "";
  String phoneNumber = "";
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
      appBar: AppBars().appBar("Sign Up"),
      body: !this.otpArrived
          ? Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    BannerCard(
                        "Welcome to JEFRs TECH\nPlease Sign-Up To Proceed"),
                    Card(
                      shadowColor: AppTheme.facebook,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              //Country Code
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
                                decoration: buildInputDecoration(
                                  hintText: "Phone",
                                  helperText: "Ex: 9012345678",
                                  prefixIcon: Icons.phone,
                                ),
                                controller: _phoneNumberEditingController,
                                validator: (String phoneNumber) =>
                                    textValidators
                                        .validatePhoneNumber(phoneNumber),
                                onSaved: (String phoneNumberValue) =>
                                    phoneNumber = phoneNumberValue,
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              //FirstName
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                  hintText: "First Name",
                                  helperText: "Ex: John",
                                  prefixIcon: Icons.person,
                                ),
                                controller: _firstNameEditingController,
                                validator: (String firstName) =>
                                    textValidators.validateFirstName(firstName),
                                onSaved: (String firstNameValue) =>
                                    firstName = firstNameValue,
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                  hintText: "Last Name",
                                  helperText: "Ex: Mike",
                                  prefixIcon: Icons.person,
                                ),
                                controller: _lastNameEditingController,
                                validator: (String lastNameValue) =>
                                    textValidators
                                        .validateLastName(lastNameValue),
                                onSaved: (String lastNameValue) =>
                                    lastName = lastNameValue,
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              //EMAIL ID
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                  hintText: "Email ID",
                                  helperText: "Ex: example@example.com",
                                  prefixIcon: Icons.email,
                                ),
                                controller: _emailIdEditingController,
                                validator: (String emailIdValue) =>
                                    textValidators
                                        .validateEmailID(emailIdValue),
                                onSaved: (String emailIdValue) =>
                                    emailId = emailIdValue,
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 3,
                              ),
                              Container(
                                child: Material(
                                  color: AppTheme.facebook,
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 2,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(5),
                                    splashColor: Colors.white30,
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        //creating user to check
                                        List _phoneCode =
                                            _currentCountryCode.split(" ");
                                        user = UserModel(
                                          email: _emailIdEditingController.text
                                              .trim(),
                                          firstName: _firstNameEditingController
                                              .text
                                              .trim(),
                                          lastName: _lastNameEditingController
                                              .text
                                              .trim(),
                                          phone: _phoneCode[1] +
                                              _phoneNumberEditingController.text
                                                  .trim(),
                                          countryCode: _currentCountryCode,
                                        );

                                        showSnackBarWithLoadingIndicatorAndText(
                                          scaffoldKey,
                                          "Please wait",
                                        );

                                        Future<bool> checkUserInDB =
                                            provider.checkUserInDB(user);

                                        //Check If user is present or Not
                                        if (await checkUserInDB) {
                                          showSnackBarWithLoadingIndicatorAndText(
                                            scaffoldKey,
                                            "Sending OTP",
                                          );
                                          this.verifyPhone(user);
                                        } else {
                                          showSnackBarWithIconAndText(
                                            scaffoldKey,
                                            "User Already Exist Please Sign-In ",
                                          );
                                        }
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(
                                          SizeConfig.heightMultiplier * 1),
                                      height: SizeConfig.heightMultiplier * 6,
                                      child: Center(
                                        child: Text(
                                          "Register",
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: height + 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            provider.setSelectedIndex(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Sign-In",
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: height + 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 6,
                    ),
                  ],
                ),
              ),
            )
          : OTPCode(
              userfromSignUp: user,
              verificationId: this.verificationId,
              comingFrom: "sign_up",
            ),
    );
  }
}
