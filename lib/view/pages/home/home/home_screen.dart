import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taosel_user_app/core/localization/check_local.dart';
import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/view/pages/auth/autth_view.dart';

import '../../../../shared/shared_commponents/commponents.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  bool isHide = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height/1,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Flexible(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/shop.svg'),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.01.sh),
                                  child: Text(
                                    "0ج.م",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                )),
                          ],
                        ),
                        Text(
                          CheckLocal.isDirectionRTL(context)
                              ? "عنوان التوصيل ^"
                              : "Delivery address ^",
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                HiveHelper().removeData('token').then(
                                  navigateAndFinish(context,AuthView()),
                                );
                              },
                              child: CircleAvatar(
                                radius: 18.sp, // Image radius
                                backgroundImage: const NetworkImage(
                                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              ///-------------------After AppBar--------------
              /// -------------Search Abd Menu Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: size.width / 1.2,
                            height: 50.h,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: CheckLocal.isDirectionRTL(context)
                                    ? "نفسك فى اية ......."
                                    : "What do you want ?......",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                suffixIcon: Container(
                                  margin: EdgeInsets.all(5.sp),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(40.h, 40.w),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.menu,
                          size: 40.sp,
                        ),
                      ],
                    ),

                    /// -------------Horizantal List
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8, // Replace with the actual number of items
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == index
                                      ? const Color(0xff0C1D2E)
                                      : Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.sp),
                                child: Text(
                                  ' مطعم $index',
                                  style: TextStyle(
                                    fontSize: 14.0.sp,
                                    color: const Color(0xff0C1D2E),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Image.asset('assets/images/lay.png'),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(CheckLocal.isDirectionRTL(context)
                            ? "الاقرب لك "
                            : "The closest to you",
                        style:TextStyle(
                          color:const Color(0xff0C1D2E),
                          fontSize: 16.sp
                        ),),
                        Text(CheckLocal.isDirectionRTL(context)
                            ? "عرض الكل "
                            : "Show All",

                          style:TextStyle(
                            decoration:  TextDecoration.underline,
                              color:const  Color(0xff0C1D2E),
                              fontSize: 16.sp
                          ),),
                      ],
                    ),
                    ///---------Grid ITEMS------------
                   SizedBox(
            height: size.height*0.4,
            child: GridView.count(
              crossAxisCount: 3, //
              physics:const NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
              return Container(
                margin:  EdgeInsets.all(8.0.sp),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ba.png', // Replace with your image path
                      width: 47.w,
                      height: 47.h,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Item $index',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color:const Color(0xff0C1D2E)
                      ),
                    ),
                  ],
                ),
              );
              }),
            ),
          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
