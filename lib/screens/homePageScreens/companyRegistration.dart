import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/formatters.dart';
import '../../config/responsive.dart';
import '../../config/styles.dart';
import '../../utils/textValidators.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bannerCard.dart';
import '../../mixins/InputFieldsMixinAndSnackBar.dart';

class CompanyRegistration extends StatefulWidget {
  @override
  _CompanyRegistrationState createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration>
    with InputFieldsMixinAndSnackBar {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextValidators textValidators = TextValidators();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailIdEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _stateEditingController = TextEditingController();

  String name = "";
  String email = "";
  String phone = "";
  String state = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: AppBars().appBar("Company Registration"),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          BannerCard("Send us a message"),
          Card(
            elevation: 10,
            shadowColor: AppTheme.facebook,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            borderOnForeground: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _nameEditingController,
                      decoration: buildInputDecoration(
                        hintText: "Name",
                        helperText: "Ex: John",
                        prefixIcon: Icons.person,
                      ),
                      validator: (String nameValue) =>
                          textValidators.validateFirstName(nameValue),
                      onSaved: (String nameValue) => name = nameValue,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailIdEditingController,
                      decoration: buildInputDecoration(
                          hintText: "Email",
                          helperText: "Ex: example@example.com",
                          prefixIcon: FeatherIcons.mail),
                      validator: (String emailValue) =>
                          textValidators.validateEmailID(emailValue),
                      onSaved: (String emailValue) => email = emailValue,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneEditingController,
                      decoration: buildInputDecoration(
                          hintText: "Phone",
                          helperText: "Ex: 9112010010",
                          prefixIcon: FeatherIcons.phone),
                      validator: (String phoneValue) =>
                          textValidators.validatePhoneNumber(phoneValue),
                      onSaved: (String phoneValue) => phone = phoneValue,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      inputFormatters: [UpperCaseTextFormatters()],
                      keyboardType: TextInputType.text,
                      controller: _stateEditingController,
                      decoration: buildInputDecoration(
                          hintText: "STATE",
                          helperText: "Ex: DELHI",
                          prefixIcon: FeatherIcons.globe),
                      validator: (String countryValue) =>
                          textValidators.validateCountry(countryValue),
                      onSaved: (String countryValue) => state = countryValue,
                    ),
                    SizedBox(height: 20),
                    Material(
                      color: AppTheme.facebook,
                      borderRadius: BorderRadius.circular(5),
                      elevation: 2,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        splashColor: Colors.white30,
                        onTap: () async {
                          String name = _nameEditingController.text;
                          String email = _emailIdEditingController.text;
                          String phone = _phoneEditingController.text;
                          String state = _stateEditingController.text;
                          String receiverPhone = "+918880303333";
                          String pitchIdeaMessage =
                              "Name: $name\nEmail: $email\nPhone: $phone\nState: $state";
                          var whatsappUrl =
                              "whatsapp://send?phone=$receiverPhone&text=$pitchIdeaMessage";
                          if (_formKey.currentState.validate()) {
                            if (await canLaunch(whatsappUrl)) {
                              await launch(whatsappUrl);
                            } else {
                              throw 'Could not launch $whatsappUrl';
                            }
                            _formKey.currentState.save();
                          }
                        },
                        child: Container(
                          margin:
                              EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                          height: SizeConfig.heightMultiplier * 6,
                          child: Center(
                            child: Text(
                              "Send",
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
          )
        ],
      ),
    );
  }
}
