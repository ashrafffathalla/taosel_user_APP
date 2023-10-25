import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/language_cubit.dart';
import '../../../data/local/hiva_helper.dart';
import '../../../provider/auth_cubit/auth_cubit.dart';
// import '../../../provider/rent_car_cubit.dart/rent_car_cubit.dart';
import 'login/login.dart';
import 'sign_up/sign_up.dart';
import 'widget/background.dart';

class AuthView extends StatefulWidget {
  const AuthView({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    HiveHelper().removeData("token");
    // BlocProvider.of<AuthCubit>(context).getCountry();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context);

    return DefaultTabController(
      initialIndex: index,
      length: 2,
      animationDuration: const Duration(milliseconds: 1000),
      child: Scaffold(
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
                BlocProvider.of<LanguageCubit>(context).selectEngLanguage();
                // BlocProvider.of<RentCarCubit>(context).regionModel.clear();
                //BlocProvider.of<RentCarCubit>(context).getRegion();
                // BlocProvider.of<AuthCubit>(context).listCountry.clear();
                //BlocProvider.of<AuthCubit>(context).getCountry();
              },
              backgroundColor: Colors.white,
              splashColor: Colors.purple.withOpacity(0.2),
              disabledElevation: 0,
              tooltip: 'ع / EN',
              child: Icon(
                Icons.language,
                color: Theme.of(context).colorScheme.primary,
                size: 35,
              ),
            ),
          ),
        ),
        body: SizedBox(
          child: Stack(
           children: [
            const BackGround(),
            SingleChildScrollView(
              padding:  EdgeInsets.only(bottom: 20.sp),
              //physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: index ==0?SizeConfig.defaultSize! * 16:SizeConfig.defaultSize!*16,
                  ),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.sp)),
                    margin:  EdgeInsets.symmetric(horizontal: 30.sp),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      padding:  EdgeInsets.all(15.sp),
                      constraints: BoxConstraints(
                          maxHeight: index == 0
                              ? SizeConfig.defaultSize! * 50
                              : SizeConfig.defaultSize! * 70),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  offset: Offset(1, 3),
                                ),
                              ],
                            ),
                            height: SizeConfig.defaultSize! * 4.5,
                            child: TabBar(
                              onTap: (value) {
                                setState(() {
                                  index = value;
                                });
                              },
                              labelColor:
                                  Theme.of(context).colorScheme.onSurface,
                              indicatorColor: Colors.white,
                              unselectedLabelColor:
                                  Theme.of(context).colorScheme.onSurface,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              tabs: [
                                Text(
                                  local!.signIn,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    fontFamily: 'Elm',
                                  ),
                                ),
                                Text(
                                  local.signUp,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    fontFamily: 'Elm',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: index==0?30.0.sp:7.sp,
                          ),
                          const Expanded(
                            flex: 1,
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Login(),
                                SignUp(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
