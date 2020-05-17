// import 'package:flutter/material.dart';
// import '../config/styles.dart';

// class ChoiceChips extends StatefulWidget {
//   final String chipTitle;
//   final bool isSelected;
//   ChoiceChips({this.chipTitle, this.isSelected});
//   @override
//   _ChoiceChipsState createState() => _ChoiceChipsState();
// }

// class _ChoiceChipsState extends State<ChoiceChips> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height / 100;
//     return Row(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(10),
//           decoration: widget.isSelected
//               ? BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: AppTheme.secondryColor.withOpacity(0.15),
//                 )
//               : null,
//           child: Text(
//             widget.chipTitle,
//             style: TextStyle(
//               color: widget.isSelected
//                   ? AppTheme.facebook
//                   : AppTheme.secondryColor.withOpacity(0.4),
//               fontSize: height + 10,
//               fontFamily: "Metropolis",
//               fontWeight: FontWeight.w900,
//               letterSpacing: 1.2
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
