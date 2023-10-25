import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:taosel_user_app/view/pages/auth/autth_view.dart';
import 'package:taosel_user_app/view/pages/auth/widget/gray_logo_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetError extends StatelessWidget {
  const ResetError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            const GrayLogoBackground(),

            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize! * 30,
                    ),
                    SvgPicture.asset("assets/images/resetError.svg"),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 4,
                    ),
                    Text(
                      local!.resetError,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      local.resetErrorDesc,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    SizedBox(
                      width: SizeConfig.defaultSize! * 15,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const AuthView()),
                                (route) => false);
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: Text(local.resetErrorButton)),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: SizeConfig.defaultSize! * 29,
            //   right: SizeConfig.defaultSize! * 9,
            //   child: SvgPicture.asset("assets/images/resetError.svg"),
            // ),
            // Positioned(
            //   top: SizeConfig.defaultSize! * 53,
            //   right: SizeConfig.defaultSize! * 12.4,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         local!.resetError,
            //         style: const TextStyle(
            //             color: Colors.black,
            //             fontSize: 25,
            //             fontWeight: FontWeight.bold),
            //       ),
            //       Text(
            //         local.resetErrorDesc,
            //         style: const TextStyle(fontSize: 16),
            //       ),
            //       SizedBox(
            //         height: SizeConfig.defaultSize! * 2,
            //       ),
            //       SizedBox(
            //         width: SizeConfig.defaultSize! * 15,
            //         child: ElevatedButton.icon(
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => const AuthView()));
            //             },
            //             icon: const Icon(Icons.arrow_back),
            //             label: Text(local.resetErrorButton)),
            //       ),
            //       /*  ElevatedButton.icon(
            //           onPressed: () {
            //             BlocProvider.of<LanguageCubit>(context)
            //                 .selectEngLanguage();
            //           },
            //           icon: const Icon(Icons.language),
            //           label: const Text("Change Languagh"))*/
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
