// import 'package:flutter/material.dart';
// import '../resources/values_manager.dart';


// class MainAppButton extends StatelessWidget {
//   const MainAppButton({
//     super.key,
//     required this.text,
//      this.textStyle,
//     this.backgroundColor ,
//     required this.onTap, this.borderRadius, this.borderColor,

//   });

//   final String text;
//   final TextStyle? textStyle;
//   final void Function() onTap;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final double? borderRadius;


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * .55,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(borderRadius?? AppSize.s24 ),
//         color: backgroundColor,
//         border: Border.all(color:borderColor?? Colors.transparent, width: AppSize.s1),
//       ),
//       child: TextButton(
//         onPressed: onTap,
//         child: Center(
//           child: FittedBox(
//             child: Text(
//               text,
//               style: textStyle,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
