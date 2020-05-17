import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import 'repository/signUpRepo.dart';
import 'repository/connectivityProvider.dart';
import 'screens/drawerScreens/contactUs.dart';
import 'screens/drawerScreens/rating.dart';
import 'screens/drawerScreens/referal.dart';
import 'screens/drawerScreens/settings.dart';
import 'screens/drawerScreens/chat.dart';
import 'screens/drawerScreens/about_us.dart';
import 'screens/homePageScreens/companyRegistration.dart';
import 'screens/homePageScreens/digitalMarketingService.dart';
import 'screens/homePageScreens/graphicDesignPages/rapidUnlimitedTaskGraphicDesignService.dart';
import 'screens/homePageScreens/graphicDesignPages/simpleTaskGraphicDesignService.dart';
import 'screens/homePageScreens/graphicDesignPages/unlimitedTaskGraphicDesignService.dart';
import 'screens/homePageScreens/graphicDesignServices.dart';
import 'screens/homePageScreens/mobileAppDesign.dart';
import 'screens/homePageScreens/pitchYourIdeaAndGetInvester.dart';
import 'screens/homePageScreens/webDesign.dart';
import 'screens/homePageScreens/notifications.dart';
import 'screens/homePageScreens/webDesignOrDevelopmentScreens/price299DollarWebDesign.dart';
import 'screens/homePageScreens/webDesignOrDevelopmentScreens/price499DollarWebDesign.dart';
import 'screens/homePageScreens/webDesignOrDevelopmentScreens/price699DollarWebDesign.dart';
import 'screens/homePageScreens/digitalMarketingServicePages/basicPackage.dart';
import 'screens/homePageScreens/digitalMarketingServicePages/professionalPackage.dart';
import 'screens/homePageScreens/digitalMarketingServicePages/businessPackage.dart';
import 'screens/components/webView.dart';
import 'screens/drawerScreens/home.dart';
import 'config/responsive.dart';

void main() {
  runApp(MyMainApp());
}

class MyMainApp extends StatefulWidget {
  @override
  _MyMainAppState createState() => _MyMainAppState();
}

class _MyMainAppState extends State<MyMainApp> {
  WebViews buildWebViewPolicy() {
    return WebViews(
      pageName: "Policy",
      url: "https://www.tech.jefrs.com/",
    );
  }

  WebViews buildWebViewPrivacy() {
    return WebViews(
      pageName: "Privacy",
      url: "https://www.tech.jefrs.com/",
    );
  }

  WebViews buildWebViewTermsOfUse() {
    return WebViews(
      pageName: "Term Of Use",
      url: "https://www.tech.jefrs.com/",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpRepo()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ],
      child: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          return OrientationBuilder(
            builder: (BuildContext context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // home: BottomNavBar(),
                theme: ThemeData(fontFamily: 'Metropolis'),
                initialRoute: "/home",
                routes: {
                  //Drawer
                  '/home': (context) => Home(),
                  '/aboutUs': (context) => AboutUs(),
                  '/referUs': (context) => Referal(),
                  '/contactUs': (context) => ContactUs(),
                  '/chat': (context) => Chat(),
                  '/rateUs': (context) => Rating(),
                  '/policy': (context) => WebViews(
                        pageName: "Policy",
                        url: "https://www.tech.jefrs.com/",
                      ),
                  '/privacy': (context) => buildWebViewPrivacy(),
                  '/termsOfUse': (context) => buildWebViewTermsOfUse(),
                  '/settings': (context) => Settings(),

                  //Notificaton
                  '/notification': (context) => Notifications(),

                  //HomePage Grid
                  '/pitchIdeaAndGetInvester': (context) =>
                      PitchYourIdeaAndGetInvester(),
                  '/companyRegistration': (context) => CompanyRegistration(),
                  '/webDesignOrDevelopment': (context) => WebDesign(),
                  '/graphicDesignServices': (context) =>
                      GraphicDesignServices(),
                  '/mobileAppDevelopment': (context) => MobilAppDesign(),
                  '/digitalMarketingService': (context) =>
                      DigitalMarketingService(),

                  //WebDesign Price card description pages
                  '/price299DollarWebDesign': (context) =>
                      Price299DollarWebDesign(),
                  '/price499DollarWebDesign': (context) =>
                      Price499DollarWebDesign(),
                  '/price699DollarWebDesign': (context) =>
                      Price699DollarWebDesign(),

                  //Graphic Design Service
                  '/rapidUnlimitedTaskGraphicDesignService': (context) =>
                      RapidUnlimitedTaskGraphicDesignService(),
                  '/simpleTaskGraphicDesignService': (context) =>
                      SimpleTaskGraphicDesignService(),
                  '/unlimitedTaskGraphicDesignService': (context) =>
                      UnlimitedTaskGraphicDesignService(),

                  //Digital Marketing Service
                  '/basicPackage': (context) => BasicPackage(),
                  '/businessPackage': (context) => BusinessPackage(),
                  '/professionalPackage': (context) => ProfessionalPackage(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
