import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/core/localization/language_cubit.dart';
import 'package:taosel_user_app/myobserver.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_cubit.dart';
import 'package:taosel_user_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taosel_user_app/provider/profile_cubit/profile_cubit.dart';
import 'package:taosel_user_app/view/pages/auth/login/login.dart';
import 'package:taosel_user_app/view/pages/auth/sign_up/sign_up.dart';
import 'package:taosel_user_app/view/pages/home/home/home_screen.dart';
import 'package:taosel_user_app/view/pages/home/layout.dart';
import 'package:taosel_user_app/view/pages/splash_screen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/style/style.dart';
import 'data/local/hiva_helper.dart';
import 'injection_container.dart';
import 'view/pages/auth/autth_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  ///------------injection Container & HIVHELPER----------
  await init();
  await HiveHelper.init();
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,widget){
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) => getIt<LanguageCubit>()),
            BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
            BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
            BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
            // BlocProvider(
            //     create: (BuildContext context) => FacebookLoginCubit()),
          ],
          child: BlocBuilder<LanguageCubit, Locale>(
              builder:(_,locale){
                return MaterialApp(
                  title: 'Taosel',
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme(),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localeResolutionCallback: (deviceLocale, supportedLocale) {
                    if (deviceLocale != null) {
                      for (Locale locale in supportedLocale) {
                        if (deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                    }
                    return supportedLocale.first;
                  },
                  locale: locale,
                  home: const SplashScreen(),
                );
              }
          ),
        );
      },

    );
  }
}

