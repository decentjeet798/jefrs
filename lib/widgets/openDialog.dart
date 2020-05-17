// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:jefrs_tech/config/styles.dart';

// enum DialogAction { yes, no }

// class Dialogs {
//   static Future<DialogAction> yesOrNoDialog(
//     BuildContext context,
//     String title,
//     String body,
//   ) async {
//     final action = await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           title: Text("View"),
//           actions: <Widget>[
//             FlatButton(
//               onPressed: () {
//                 Navigator.of(context).pop(DialogAction.no);
//               },
//               child: Text(
//                 "No",
//                 style: TextStyle(
//                   color: AppTheme.facebook,
//                   fontFamily: 'Metropolis',
//                 ),
//               ),
//             ),
//             RaisedButton(
//               color: AppTheme.facebook,
//               onPressed: () {
//                 Navigator.of(context).pop(DialogAction.yes);
//               },
//               child: Text(
//                 "Yes",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Metropolis',
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//     return (action != null) ? action : DialogAction.no;
//   }
// }
