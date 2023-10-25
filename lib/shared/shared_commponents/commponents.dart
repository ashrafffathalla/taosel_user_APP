import 'package:flutter/material.dart';

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
    print(str.replaceAll('/', '-'));
    return str.replaceAll('/', '-');


}
Future<void> startDelay() async {
  await Future.delayed(Duration(seconds: 2));
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

