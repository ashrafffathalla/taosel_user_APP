import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/core/localization/check_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../../../../../core/size_config/size_config.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 8),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.sp, // Image radius
                  backgroundImage: const NetworkImage(
                    'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                  ),
                ),
                SizedBox(width: size.width*0.02,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ashraf Fathalla',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                        fontWeight: FontWeight.w600
                    ),),
                    Text('ashraf@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
