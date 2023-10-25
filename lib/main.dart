import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/core/localization/language_cubit.dart';
import 'package:taosel_user_app/view/pages/splash_screen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'data/local/hiva_helper.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ///------------injection Container & HIVHELPER----------
  await init();
  await HiveHelper.init();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

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
            // BlocProvider<LanguageCubit>(
            //     create: (context) => getIt<LanguageCubit>()),
          ],
          child: BlocBuilder<LanguageCubit, Locale>(
              builder:(_,locale){
                return MaterialApp(
                  title: 'Taosel',
                  theme: ThemeData(),
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

