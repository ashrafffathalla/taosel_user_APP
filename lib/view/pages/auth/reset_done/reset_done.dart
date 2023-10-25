import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:taosel_user_app/view/pages/auth/reset_error/reset_error.dart';
import 'package:taosel_user_app/view/pages/auth/widget/gray_logo_background.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/localization/language_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../provider/auth_cubit/auth_cubit.dart';
// import '../../../../provider/rent_car_cubit.dart/rent_car_cubit.dart';
import '../autth_view.dart';

class ResetDone extends StatelessWidget {
  const ResetDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FadedSlideAnimation(
        beginOffset: const Offset(0.8, 0.2),
        endOffset: const Offset(0, 0),
        slideDuration: const Duration(milliseconds: 3000),
        slideCurve: Curves.easeInOut,
        child: Container(
          height: 45.sp,
          width: 45.sp,
          child: FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<LanguageCubit>(context).selectEngLanguage();
              // BlocProvider.of<RentCarCubit>(context).regionModel.clear();
              // BlocProvider.of<RentCarCubit>(context).getRegion();
              // BlocProvider.of<AuthCubit>(context).listCountry.clear();
              // BlocProvider.of<AuthCubit>(context).getCountry();
            },
            backgroundColor: Colors.white,
            splashColor: Colors.purple.withOpacity(0.2),
            //focusColor: Colors.green,
            disabledElevation: 0,
            tooltip: 'ع / EN',
            // autofocus: true,
            child: Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.primary,
              size: 35,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
           // const GrayLogoBackground(),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize! * 30.5,
                    ),
                    SvgPicture.asset("assets/images/allDone.svg"),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 8,
                    ),
                    Text(
                      local!.done,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      local.doneDesc,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 7,
                    ),
                    SizedBox(
                      width: SizeConfig.defaultSize! * 33,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const AuthView()),
                              (route) => false);
                        },
                        icon: Row(
                          children: [

                            const Icon(Icons.arrow_circle_right),
                          ],
                        ),
                        label: Text(local.doneButton),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //     top: SizeConfig.defaultSize! * 29,
            //     right: SizeConfig.defaultSize! * 12,
            //     child: SvgPicture.asset("assets/images/allDone.svg")),
            // Positioned(
            //   top: SizeConfig.defaultSize! * 53,
            //   right: SizeConfig.defaultSize! * 9.5,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         local!.done,
            //         style:const  TextStyle(
            //             color: Colors.black,
            //             fontSize: 25,
            //             fontWeight: FontWeight.bold),
            //       ),
            //       Text(
            //         local.doneDesc,
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       SizedBox(
            //         height: SizeConfig.defaultSize! * 2,
            //       ),
            //       SizedBox(
            //         width: SizeConfig.defaultSize! * 15,
            //         child: ElevatedButton.icon(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const ResetError()));
            //           },
            //           icon:const  Icon(Icons.arrow_back),
            //           label: Text(local.doneButton),
            //         ),
            //       ),
            //       ElevatedButton.icon(
            //           onPressed: () {
            //             BlocProvider.of<LanguageCubit>(context)
            //                 .selectEngLanguage();
            //           },
            //           icon: const Icon(Icons.language),
            //           label: const Text("Change Languagh"))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
