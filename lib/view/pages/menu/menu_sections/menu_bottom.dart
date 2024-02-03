import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/shared/shared_commponents/commponents.dart';
import 'package:taosel_user_app/view/pages/auth/autth_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/size_config/size_config.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
            top: SizeConfig.defaultSize! * 8,
            bottom: SizeConfig.defaultSize! * 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: .0.w),
                  child: GestureDetector(
                      onTap: () {
                        HiveHelper().removeData('token');
                        navigateAndFinish(context, AuthView());
                      },
                      child:  Text('حذف الحساب',style: TextStyle(
                          color: Colors.red,
                        fontSize: 16.sp
                      ),)),
                ),
              ],
            ),
            SizedBox(height: 10.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      "assets/images/version.svg",
                      color: Colors.amber,
                    )
                ),
                const Text(
                  "Version 1.0",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),

          ],
        ),
      );
}
