import 'package:flutter/material.dart';
import '../config/responsive.dart';
import '../config/styles.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String name;
  final String time;
  final bool type;
  ChatMessage({this.text, this.name, this.type, this.time});

  List<Widget> receiverMessage(context) {
    var height = MediaQuery.of(context).size.height / 100;
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: SizeConfig.widthMultiplier * 10,
        height: SizeConfig.widthMultiplier * 10,
        decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/img/pick_idea.jpg"),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, right: 100),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppTheme.facebook.withOpacity(0.9),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Metropolis',
                  fontSize: height + 8,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> senderMessage(context) {
    var height = MediaQuery.of(context).size.height / 100;

    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, left: 100),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppTheme.facebook.withOpacity(0.9),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: height + 8,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        width: SizeConfig.widthMultiplier * 10,
        height: SizeConfig.widthMultiplier * 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/img/defaultProfile.png"),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? senderMessage(context) : receiverMessage(context),
      ),
    );
  }
}
