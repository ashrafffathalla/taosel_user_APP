
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import '../../core/localization/check_local.dart';
import '../../core/size_config/size_config.dart';

class CustomMainBtn extends StatelessWidget {
  const CustomMainBtn({Key? key, required this.ontap,this.iconButton,this.textButton}) : super(key: key);
  final Function()? ontap;
  final dynamic iconButton;
  final String? textButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * 35,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    // side: BorderSide(color: Colors.red)
                  )
              )),
          onPressed: ontap,
          child: Row(
            children: [
              iconButton,
              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.14),
                child: Text(textButton.toString(),style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white
                ),),
              ),
            ],
          )),
    );

  }
}
