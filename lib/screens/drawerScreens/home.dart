import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:connectivity/connectivity.dart';

import '../../Services/company_service.dart';
import '../../config/responsive.dart';
import '../components/drawer.dart';
import '../../widgets/appBar.dart';
import '../../repository/signUpRepo.dart';

import '../drawerScreens/chat.dart';
import '../navBarScreens/signIn.dart';
import '../navBarScreens/signUp.dart';
import '../navBarScreens/logOut.dart';
import '../../mixins/InputFieldsMixinAndSnackBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with InputFieldsMixinAndSnackBar {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  Brightness _brightnessDark = Brightness.dark;
  Brightness _brightnessLight = Brightness.light;
  Brightness _brightness = Brightness.light;

  bool enabled = true;
  bool isOpen = false;

  String assetPDFPath = "";
  String urlPDFPath = "";

  var name = "";
  var email = "";

  void tap() {
    setState(() {
      _brightness = _brightnessDark;
    });
  }

  SignUpRepo provider;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await _prefs;
    name = prefs.getString("name");
    // phone = prefs.getString("phone") ;
    email = prefs.getString("email");
    setState(() {});
  }

  //Connectivity
  bool connectionStatus = false;
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  //End of Connectivity

  @override
  void initState() {
    super.initState();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        setState(() {
          connectionStatus = true;
          // _isLoading = true;
        });
      } else if (result == ConnectivityResult.none) {
        setState(() {
          connectionStatus = false;
        });
      }
    });

    initPrefs();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    initPrefs().then((_) {
      final notifier = Provider.of<SignUpRepo>(context, listen: false);
      if (this.provider != notifier) {
        this.provider = notifier;

        print(prefs);

        if (prefs.containsKey("userLoggedIn")) {
          var userLoggedIn = prefs.getBool("userLoggedIn");
          if (userLoggedIn != null) {
            Future.microtask(() => notifier.setUserLoggedIn(userLoggedIn));
          } else {
            Future.microtask(() => notifier.setUserLoggedIn(false));
          }
        } else {
          Future.microtask(() => notifier.setUserLoggedIn(false));
        }
      }
    });
  }

  List<String> _bannerImages = [
    'assets/img/slider-img3.jpg',
    'assets/img/slider-img2.jpg',
    'assets/img/slider-img1.jpg',
  ];

  ListTile listTile(IconData titleIcon, String tileName, [String route]) {
    return ListTile(
      leading: Icon(titleIcon),
      title: Text(tileName),
      onTap: () {
        setState(() {
          _brightness = _brightnessLight;
        });
        route == null
            ? Navigator.pop(context)
            : Navigator.pushNamed(context, route);
      },
    );
  }

  CustomScrollView buildCustomScrollView(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        AppBars().homeAppBar(tap, drawerKey, context),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: SizeConfig.heightMultiplier * 30,
              width: double.infinity,
              child: CarouselSlider.builder(
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
                height: SizeConfig.heightMultiplier * 30,
                itemCount: _bannerImages.length,
                itemBuilder: (BuildContext context, int itemIndex) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        _bannerImages[itemIndex],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Services",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ]),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 3 / 3,
          children: companyServices.map((i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(i.route);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: SizeConfig.heightMultiplier * 8,
                      width: SizeConfig.heightMultiplier * 8,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(i.img))),
                    ),
                    Text(
                      i.title,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userLoggedINProvider = Provider.of<SignUpRepo>(context);
    var selectedIndex = Provider.of<SignUpRepo>(context);
    final whenUserNotSignedINTabs = [
      buildCustomScrollView(context),
      SignIn(),
      SignUp(),
      Chat(),
    ];

    final whenUserSignedINtabs = [
      buildCustomScrollView(context),
      LogOut(),
      Chat(),
    ];

    double openDrawer(){
      if(selectedIndex.getSelectedIndex != 0){
        return 0;
      }
      return null;
    }
           
    

    return Scaffold(
      key: drawerKey,
      drawerEdgeDragWidth: openDrawer(),
      drawer: DrawerList(
        name: name != null ? name : "Guest",
        email: email != null ? email : "",
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex.getSelectedIndex,
        selectedItemColor: Colors.black87,
        onTap: (int index) {
          selectedIndex.setSelectedIndex(index);
        },
        items: userLoggedINProvider.getUserLoggedIn
            ? [
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.logOut), title: Text("Log out")),
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.headphones),
                    title: Text("Contact us")),
              ]
            : [
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.userCheck), title: Text("Sign In")),
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.userPlus), title: Text("Sign Up")),
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.headphones),
                    title: Text("Contact Us")),
              ],
      ),
      body: connectionStatus
          ? userLoggedINProvider.getUserLoggedIn
              ? whenUserSignedINtabs[selectedIndex.getSelectedIndex]
              : whenUserNotSignedINTabs[selectedIndex.getSelectedIndex]
          : offlinePage(),
    );
  }
}
