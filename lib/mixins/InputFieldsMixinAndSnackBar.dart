import 'package:flutter/material.dart';
import '../config/styles.dart';
import '../config/responsive.dart';


class InputFieldsMixinAndSnackBar {
  InputDecoration buildInputDecoration(
      {String hintText, String helperText, IconData prefixIcon}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      hintText: hintText,
      helperText: helperText,
      helperStyle: TextStyle(
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w600,
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: AppTheme.facebook,
      ),
      errorStyle: TextStyle(
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w600,
      ),
      focusedBorder: OutlineInputBorder(
        gapPadding: 300,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: AppTheme.facebook),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: AppTheme.secondryColor),
      ),
      errorBorder: OutlineInputBorder(
          gapPadding: 300,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.red)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: AppTheme.facebook)),
    );
  }

  showSnackBarWithIconAndText(scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        elevation: 6,
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: <Widget>[
            Container(padding: EdgeInsets.all(5), child: Icon(Icons.warning)),
            SizedBox(width: 15),
            Text(
              message,
              style: TextStyle(fontFamily: 'Metropolis', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  showSnackBarWithLoadingIndicatorAndText(scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        elevation: 6,
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        content: Container(
          child: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 15),
              Text(
                message,
                style: TextStyle(fontFamily: 'Metropolis', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

   Center offlinePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(
              "assets/img/offline.png",
            ),
            fit: BoxFit.cover,
            height: SizeConfig.heightMultiplier * 50,
          ),
          Container(
            height: SizeConfig.heightMultiplier * 12,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.warning,
                  color: Colors.white,
                  size: SizeConfig.imageSizeMultiplier * 10,
                ),
                Text(
                  "oops it seems you are offline! \n please check your connection.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
}
