import 'dart:io';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../drawerScreens/pdfViewer.dart';
import '../../repository/signUpRepo.dart';

class DrawerList extends StatefulWidget {
  final String email;
  final String name;

  const DrawerList({this.email, this.name});

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  String assetPDFPath = "";
  // String urlPDFPath = "";

  Brightness _brightnessDark = Brightness.dark;
  Brightness _brightnessLight = Brightness.light;
  Brightness _brightness = Brightness.light;

  void tap() {
    setState(() {
      _brightness = _brightnessDark;
    });
  }

  ListTile listTile(IconData titleIcon, String tileName,
      [String route, bool userLoggedInVal, SignUpRepo selectedIndex]) {
    return ListTile(
      leading: Icon(titleIcon),
      title: Text(tileName),
      onTap: () {
        setState(() {
          _brightness = _brightnessLight;
        });
        print("USERLOGGEDINVAL ===> $userLoggedInVal");
        if (userLoggedInVal) {
          if (route == '/home') {
            Navigator.pop(context);
            selectedIndex.setSelectedIndex(0);
          } else {
            Navigator.pushNamed(context, route);
          }
        } else {
          Navigator.pop(context);
          selectedIndex.setSelectedIndex(1);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    fetchFileFromAsset("assets/files/jefrsppt.pdf").then((f) {
      assetPDFPath = f.path;
      print("ASSETPATH ===> $assetPDFPath");
    });
  }

  Future<File> fetchFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/jefrsppt.pdf");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var userLoggedInVal = Provider.of<SignUpRepo>(context).getUserLoggedIn;
    var selectedIndex = Provider.of<SignUpRepo>(context);
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            accountName: Text(widget.name),
            accountEmail: Text(widget.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/img/defaultProfile.png"),
            ),
            otherAccountsPictures: <Widget>[
              IconButton(
                icon: Icon(FeatherIcons.settings, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/settings");
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: <Widget>[
                listTile(FeatherIcons.home, 'Home', '/home', userLoggedInVal,
                    selectedIndex),
                listTile(FeatherIcons.userCheck, "About Us", '/aboutUs',
                    userLoggedInVal, selectedIndex),
                ListTile(
                  leading: Icon(FeatherIcons.fileText),
                  title: Text("View us"),
                  onTap: () {
                    if (assetPDFPath != null && userLoggedInVal) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewPage(
                            path: assetPDFPath,
                          ),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      selectedIndex.setSelectedIndex(1);
                    }
                  },
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text('Communication'),
                  onTap: () {
                    setState(() {
                      _brightness = _brightnessLight;
                    });
                    Navigator.pop(context);
                  },
                ),
                listTile(FeatherIcons.messageCircle, "Refer us", '/referUs',
                    userLoggedInVal, selectedIndex),
                listTile(FeatherIcons.headphones, "Help and Support",
                    '/contactUs', userLoggedInVal, selectedIndex),
                listTile(FeatherIcons.messageSquare, "Chat with us", '/chat',
                    userLoggedInVal, selectedIndex),
                listTile(FeatherIcons.star, "Rattings", '/rateUs',
                    userLoggedInVal, selectedIndex),
                listTile(FeatherIcons.refreshCcw, "Refund Policy", '/policy',
                    userLoggedInVal, selectedIndex),
                listTile(FeatherIcons.lock, "Privacy", '/privacy',
                    userLoggedInVal, selectedIndex),
                listTile(FeatherIcons.book, "Terms of Use", '/termsOfUse',
                    userLoggedInVal, selectedIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
