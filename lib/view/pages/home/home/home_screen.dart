import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taosel_user_app/core/localization/check_local.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key,}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHide =false;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height*0.05,),
          Flexible(
            child: SizedBox(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
                child: Row(

                  children: [
                   Row(
                     children: [
                       SvgPicture.asset('assets/images/shop.svg'),
                       SizedBox(width: size.width*0.01,),
                       Container(
                           decoration: BoxDecoration(
                               color: Theme.of(context).colorScheme.primary,
                               borderRadius: BorderRadius.circular(8)
                           ),
                           child: Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 0.01.sh),
                             child: Text(
                               "0ج.م",
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 14.sp
                               ),
                             ),
                           )),
                     ],
                   ),
                    Spacer(),
                    ///----
                    Text(
                      CheckLocal.isDirectionRTL(context)?"عنوان التوصيل ^":"Delivery address ^",
                    ),
                    ///----
                    Spacer(),
                   Row(
                     children: [
                       Text(
                         CheckLocal.isDirectionRTL(context)?"Ashraf Fathalla":"Delivery address ^",
                       ),
                       CircleAvatar(
                         radius: 20.sp, // Image radius
                         backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',),
                       )
                     ],
                   )

                  ],
                ),
              ),
            ),
          ),
          ///-------------------After AppBar--------------
          /// -------------Search Abd Menu Section
      TextField(
        decoration: InputDecoration(
          hintText: CheckLocal.isDirectionRTL(context)?"نفسك فى اية .......":"What do you want ?......",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          suffixIcon: Container(
            margin: EdgeInsets.all(10.sp),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(40.h, 40.w), backgroundColor: Theme.of(context).colorScheme.primary,
                shape:  RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(8.0),
                ),
              ),
              child: const Icon(Icons.search,color: Colors.white,),
              onPressed: () {},
            ),
          ),
        ),
      ),

        ],
      ),
    );
  }
}
