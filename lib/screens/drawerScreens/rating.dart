import 'package:flutter/material.dart';

import '../../config/responsive.dart';
import '../../config/styles.dart';
import '../../widgets/appBar.dart';
import '../../widgets/starRating.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    SizedBox h1point5() {
      return SizedBox(
        height: SizeConfig.heightMultiplier * 1.5,
      );
    }

    SizedBox h2point5() {
      return SizedBox(
        height: SizeConfig.heightMultiplier * 2.5,
      );
    }

    return Scaffold(
      appBar: AppBars().appBar("Rate us"),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
                      child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    "assets/img/rating.png",
                  ),
                  fit: BoxFit.cover,
                  height: SizeConfig.imageSizeMultiplier * 40,
                  alignment: Alignment.center,
                ),
                h2point5(),
                Text(
                  "Your opinion matters to us!",
                  style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: height / 100 + 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                      textAlign: TextAlign.center,
                ),
                h1point5(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "We work super hard to make better for you, and would love to know how would you rate our app?",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: height / 100 + 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                h2point5(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StarRating(
                      rating: rating,
                      size: 40.0,
                      color: Colors.amber,
                      onRatingChanged: (rating) =>
                          setState(() => this.rating = rating),
                    ),
                  ],
                ),
                
                h2point5(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 30,
                  ),
                  child: Material(
                    color: Color(0xFF3B5999),
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      splashColor: Colors.white30,
                      onTap: () => print("Submit"),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: SizeConfig.heightMultiplier * 6,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: height / 100 + 10,
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
                h1point5(),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "No Thanks",
                    style: TextStyle(
                        color: AppTheme.facebook, fontSize: height / 100 + 10),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
