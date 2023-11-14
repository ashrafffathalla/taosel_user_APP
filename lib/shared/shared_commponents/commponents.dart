import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/size_config/size_config.dart';

void navigateTo(context,widget ){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

}
String  replaceText({required String str}){
    str = str.replaceAll('٠', '0');
    str = str.replaceAll('١', '1');
    str = str.replaceAll('٢', '2');
    str = str.replaceAll('٣', '3');
    str = str.replaceAll('٤', '4');
    str = str.replaceAll('٥', '5');
    str = str.replaceAll('٦', '6');
    str = str.replaceAll('٧', '7');
    str = str.replaceAll('٨', '8');
    str = str.replaceAll('٩', '9');

    return str.replaceAll('/', '-');


}
Future<void> startDelay() async {
  await Future.delayed(const Duration(seconds: 2));
}
void navigateAndFinish(
    context,widget
    )=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>widget,
        ),
            (route) {
          return false;
        }
    );

// ///-------------------------------------
//  customMainBtn( onTap,dynamic iconButton,String? textButton,context){
//   Container(
//     width: SizeConfig.defaultSize! * 35,
//     decoration: BoxDecoration(
//       gradient: const LinearGradient(
//         colors: [Color(0xff065BFF), Color(0xff161EEE)], // Define your gradient colors
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
//     ),
//     child: ElevatedButton(
//         style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//
//                 // side: BorderSide(color: Colors.red)
//               ),
//             ),
//             backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
//         ),
//         onPressed: onTap,
//         child: Row(
//           children: [
//             iconButton,
//             Padding(
//               padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.14),
//               child: Text(textButton.toString(),style: TextStyle(
//                   fontSize: 18.sp,
//                   color: Colors.white
//               ),),
//             ),
//           ],
//         )),
//   );
// }