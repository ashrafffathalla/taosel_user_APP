import 'package:taosel_user_app/core/localization/check_local.dart';
import 'package:taosel_user_app/provider/profile_cubit/profile_cubit.dart';
import 'package:taosel_user_app/shared/shared_commponents/commponents.dart';
import 'package:taosel_user_app/view/pages/home/layout.dart';
import 'package:taosel_user_app/view/pages/menu/my_account/image_icence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:hijri_picker/hijri_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../../core/constant/lang_code.dart';
import '../../../../../core/validation/form_validator.dart';
import '../../../../../data/local/hiva_helper.dart';

import '../../../../../provider/auth_cubit/auth_cubit.dart';
import '../../../../widgets/custom_text_field_infouser.dart';
import '../../../auth/autth_view.dart';
import 'account_info_container.dart';
// import 'package:hijri/hijri_calendar.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
class AccountInfo extends StatefulWidget {
  AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  String? token = HiveHelper().getData("token");

  DateTime ? idEnd ;
  DateTime ? birthDate ;
  DateTime ?licenceEnd ;


  late var userNameController = TextEditingController();

  late var emailController = TextEditingController();

  late var phoneController = TextEditingController();

  late var dateController = TextEditingController();

  late var locationController = TextEditingController();

  //late var nationalityController = TextEditingController();

  late var newPasswordController = TextEditingController();

  late var confirmPasswordController = TextEditingController();

  late var licenseIdController = TextEditingController();

  late var copyIdController = TextEditingController();

  late var licenseIdEndController = TextEditingController();
  bool switchValue = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ProfileCubit>(context).getProfileData();
    // BlocProvider.of<AuthCubit>(context).getCountry();
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = BlocProvider.of<ProfileCubit>(context);
    // BlocProvider.of<ProfileCubit>(context).getProfileData();
    final local = AppLocalizations.of(context);
    // var cubit2 = BlocProvider.of<AuthCubit>(context);
/*
ransform(
          alignment: Alignment.center,
          transform: CheckLocal.isDirectionRTL(context)
              ? Matrix4.rotationY(math.pi)
              : Matrix4.rotationX(math.pi / 90),
          child: SvgPicture.asset(
            "assets/images/arrow.svg",
            height: 70.sp,
            width: 100.sp,
          ),
        ),
 */
    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          height: SizeConfig.screenHeight,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30.sp,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                child: InkWell(
                  onTap: (){
                    _formKey.currentState!.validate();
                      BlocProvider.of<ProfileCubit>(context)
                          .updateAllFieldsAccInfo(
                        name: userNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      local!.save,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ],
            toolbarHeight: SizeConfig.screenHeight! * 0.08,
            backgroundColor: Colors.white.withOpacity(0),
          ),
          body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              // if (state is DeleteProfileSuccess) {
              //   showDialog(
              //       context: context,
              //       builder: (_) {
              //         return AlertDialog(
              //           title: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Center(
              //                   child: Icon(
              //                 Icons.check_circle,
              //                 color: Colors.green,
              //                 size: 30,
              //               )),
              //             ],
              //           ),
              //           content: Text(
              //             'تم حذف الحساب بنجاح',
              //             textAlign: TextAlign.center,
              //           ),
              //         );
              //       });
              //   navigateAndFinish(context, AuthView());
              // }
              if (state is ProfileError) {
                state.error.contains('تسجيل الدخول') ||
                        state.error.contains('logged in')
                    ? navigateAndFinish(context, AuthView())
                    : showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(

                            content: Text(state.error.toString()),
                          );
                        });
              }else if  (state is UpdateAllProfileLoaded) {
                     showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.black87,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 30,
                                )),
                          ],
                        ),
                        content: Text(CheckLocal.isDirectionRTL(context)?'تم تحديث معلومات الحساب ':'Account Information Updated',textAlign: TextAlign.center,),
                      );
                    });
              }
              if (state is UpdateProfileError) {
                BlocProvider.of<ProfileCubit>(context).getProfileData();
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: SvgPicture.asset(
                                    'assets/images/infoIcon.svg')),
                          ],
                        ),
                        content: Text(
                          state.error.replaceAll('[', "").replaceAll(']', ""),
                          textAlign: TextAlign.center,
                        ),
                      );
                    });
              }
              if (state is ProfileLoaded) {
                userNameController.text = state.profileListData.data!.name!;
                emailController.text = state.profileListData.data!.email!;
                phoneController.text = state.profileListData.data!.phone!;
              }

              if (state is UpdateProfileLoaded||state is UpdateAllProfileLoaded) {
                BlocProvider.of<ProfileCubit>(context).getProfileData().then((value) {
                  //Navigator.pop(context);
                });
              }
              if (state is UpdateAllProfileLoaded && makeToMakeOrder=="1") {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                   Navigator.of(context).pop(true);
                                   Navigator.of(context).pop(true);
                                   Navigator.of(context).pop(true);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  height: 34.sp,
                                  decoration:
                                  BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Center(
                                      child: Text(
                                        CheckLocal.isDirectionRTL(context) ? 'استكمال الطلب' : 'Continue Order',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () {
                                  navigateAndFinish(context, LayoutScreen());
                                },
                                child:
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.32,
                                  height: 34.sp,
                                  decoration:
                                  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Center(
                                      child: Text(CheckLocal.isDirectionRTL(context) ? 'لا' : 'Close', style: TextStyle(color: Colors.black))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.sp,
                          )
                        ],
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: SvgPicture.asset('assets/images/infoIcon.svg')),
                          ],
                        ),
                        content: SingleChildScrollView(
                          child: Text(
                            CheckLocal.isDirectionRTL(context)?"هل تريد استكمال الطلب ؟":"Do you want to complete the application?",
                            textAlign:
                            TextAlign.center,),
                        ),
                        titlePadding:
                        EdgeInsets.only(top: 10.sp, bottom:0),
                        actionsPadding:
                        EdgeInsets.only(top: 0),
                      );
                    });
              }
            },
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
                return SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: GestureDetector(
                    onTap:(){FocusScope.of(context).requestFocus( FocusNode());},
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.defaultSize! * 1,
                          ),
                          Center(
                            child: Text(
                              local.accountInfo,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.08,
                                vertical: 10.sp),
                            child: Center(
                              child: Text(
                                local.completeAccInfo,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50.sp,
                            color: Colors.blueGrey.withOpacity(0.3),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width * 0.1),
                                  child: Text(local.personalData,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width * 0.05),
                                      child: Text(local.fullName,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242,),),),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  containerIcon: Icons.account_box,
                                  widget: CustomTextFeildAccInfo(
                                    controller: userNameController,
                                    type: TextInputType.name,
                                    label: local.editName,
                                  ),
                                  hijriWidget: Container(),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width * 0.05),
                                      child: Text(
                                          local.emailAddress,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242),
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  hijriWidget: Container(),
                                  isEdit: true,
                                  containerIcon: Icons.mail,
                                  widget: CustomTextFeildAccInfo(
                                    controller: emailController,
                                    type: TextInputType.name,
                                    label: local.editName,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width * 0.05),
                                      child: Text(
                                          local.phoneNumber,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242))),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  hijriWidget: Container(),
                                  containerIcon: Icons.phone,
                                  widget: Directionality(
                                    textDirection: ui.TextDirection.ltr,
                                    child: CustomTextFeildAccInfo(
                                      inputFormatters: [
                                        new LengthLimitingTextInputFormatter(9),
                                      ],
                                      validat: (value) =>
                                          FormValidator.phoneValidate(context, value),
                                      controller: phoneController,
                                      type: TextInputType.phone,
                                      label: local.editName,
                                      preText: CheckLocal.isDirectionRTL(context)?' + 966 | ':' + 966 | ',
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                      child: Text(
                                        local.birthDate,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242),
                                          ),),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width * 0.05),
                                      child: Text(
                                          local.address2,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242))),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  hijriWidget: Container(),
                                  containerIcon: Icons.location_on,
                                  widget: CustomTextFeildAccInfo(
                                    controller: locationController,
                                    type: TextInputType.name,
                                    label: local.editName,
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: EdgeInsets.symmetric(
                                //           horizontal:
                                //               MediaQuery.of(context).size.width *
                                //                   0.05),
                                //       child: Text(local.nationality,
                                //           style: TextStyle(
                                //               fontSize: 14.sp,
                                //               color: Color(0xff424242))),
                                //     ),
                                //   ],
                                // ),
                                //
                                // AccountInfoContainer(
                                //   isPasswordScreen: true,
                                //   isEdit: true,
                                //   hijriWidget: Container(),
                                //   containerIcon: Icons.public,
                                //   widget: SizedBox(
                                //     height: 45.sp,
                                //     child: DropdownButtonFormField<CountryModel>(
                                //       elevation: 0,
                                //       isExpanded: true,
                                //       hint:  Padding(
                                //         padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                                //         child: Text(
                                //           cubit.profileListProfileData!.data.nationality.toString().isEmpty?local.selectCountry:cubit.profileListProfileData!.data.nationality.toString(),
                                //         ),
                                //       ),
                                //       // borderRadius: BorderRadius.circular(25),
                                //       iconEnabledColor: Colors.amber,
                                //       decoration: InputDecoration(
                                //           contentPadding: const EdgeInsets.symmetric(
                                //               vertical: 0.0, horizontal: 0
                                //           )),
                                //       value: countryModel,
                                //       items: cubit2.listCountry.map((e) {
                                //         return DropdownMenuItem<CountryModel>(
                                //             value: e, child: Text(e.nationality));
                                //       }).toList(),
                                //       onChanged: (value) {
                                //         setState(() {
                                //           countryModel = value;
                                //           // print(countryModel!.id.toString()+'555');
                                //         });
                                //       },
                                //     ),
                                //   ),
                                // ),
                                ///
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 10.sp),
                                  child: Container(
                                    height: 50.sp,
                                    color: Colors.blueGrey.withOpacity(0.3),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  MediaQuery.of(context).size.width * 0.1,
                                              vertical: 15.sp,),
                                          child: Text(local.licenceData,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                      child: Text(local.coyNum,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242))),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  hijriWidget: Container(),
                                  containerIcon: LineAwesomeIcons.credit_card,
                                  widget: CustomTextFeildAccInfo(
                                    controller: copyIdController,
                                    type: TextInputType.number,
                                    label: local.licenseIDNum,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                      child: Text(local.endDate,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242))),
                                    ),
                                  ],
                                ),

                                ///
                                ///
                                ///
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 10.sp),
                                  child: Container(
                                    height: 50.sp,
                                    color: Colors.blueGrey.withOpacity(0.3),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  MediaQuery.of(context).size.width *
                                                      0.1,
                                              vertical: 15.sp),
                                          child: Text(local.licence,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                      child: Text(local.licenseIDNum,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242))),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  hijriWidget: Container(),
                                  containerIcon: LineAwesomeIcons.credit_card,
                                  widget: CustomTextFeildAccInfo(
                                    inputFormatters: [
                                      new LengthLimitingTextInputFormatter(10),
                                    ],
                                    validat: (value) =>
                                        FormValidator.licenceValidate(context, value),
                                    controller: licenseIdController,
                                    type: TextInputType.number,
                                    label: local.licenseIDNum,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                      child: Text(local.endDate,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xff424242))),
                                    ),
                                  ],
                                ),
                                // AccountInfoContainer(
                                //   isPasswordScreen: true,
                                //   isEdit: true,
                                //   isDate: true,
                                //   hijriWidget: Row(
                                //     children: [
                                //       Switch(
                                //         activeColor: Colors.orangeAccent,
                                //         activeTrackColor: Theme.of(context).colorScheme.primary,
                                //         value: switchValue,
                                //         onChanged: (value){
                                //           switchValue = value;
                                //           BlocProvider.of<ProfileCubit>(context).updateSwitchState();
                                //         },
                                //       ),
                                //       Text(CheckLocal.isDirectionRTL(context)?"هـ":"HJ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                //     ],
                                //   ),
                                // ),

                                ///
                                // AccountInfoContainer(
                                //   isEdit: false,
                                //   isPasswordScreen: true,
                                //   hijriWidget: Container(),
                                //   containerIcon: Icons.image,
                                //   widget: Padding(
                                //     padding:
                                //         EdgeInsets.symmetric(vertical: 12.0.sp),
                                //     child: Text(local.licenseID),
                                //   ),
                                //   containerEdit: () {
                                //     navigateTo(
                                //         context,
                                //         LicenceImage(
                                //             image: cubit.profileListProfileData!.data.licenseImage.toString()
                                //                 ));
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          // cubit.profileListProfileData!.data.delete == 1
                          //     ? InkWell(
                          //         //  onTap: () => context.read<ProfileCubit>().deleteProfile(),
                          //         onTap: () {
                          //           showDialog(
                          //               context: context,
                          //               builder: (BuildContext context) {
                          //                 return AlertDialog(
                          //                   shape: RoundedRectangleBorder(
                          //                       borderRadius: BorderRadius.all(
                          //                           Radius.circular(20.0))),
                          //                   backgroundColor: Colors.white,
                          //                   content: Container(
                          //                     child: Text(
                          //                       CheckLocal.isDirectionRTL(context)
                          //                           ? 'هل انت متأكد من حذف الحساب'
                          //                           : 'Are You sure Delete Account'
                          //                               .toString(),
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .bodyText1,
                          //                     ),
                          //                   ),
                          //                   actions: [
                          //                     Row(
                          //                       children: [
                          //                         InkWell(
                          //                           onTap: () {
                          //                             BlocProvider.of<ProfileCubit>(
                          //                                     context)
                          //                                 .deleteProfile();
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Row(
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment.start,
                          //                             children: [
                          //                               Padding(
                          //                                 padding: EdgeInsets.symmetric(
                          //                                     horizontal:
                          //                                         MediaQuery.of(
                          //                                                     context)
                          //                                                 .size
                          //                                                 .width *
                          //                                             0.08,
                          //                                     vertical: 8),
                          //                                 child: Text(
                          //                                   CheckLocal
                          //                                           .isDirectionRTL(
                          //                                               context)
                          //                                       ? 'نعم'
                          //                                       : 'OK'.toString(),
                          //                                   style: Theme.of(context)
                          //                                       .textTheme
                          //                                       .bodyText1,
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         SizedBox(
                          //                           width: 7,
                          //                         ),
                          //                         InkWell(
                          //                           onTap: () {
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Row(
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment.start,
                          //                             children: [
                          //                               Padding(
                          //                                 padding: EdgeInsets.symmetric(
                          //                                     horizontal:
                          //                                         MediaQuery.of(
                          //                                                     context)
                          //                                                 .size
                          //                                                 .width *
                          //                                             0.08,
                          //                                     vertical: 8),
                          //                                 child: Text(
                          //                                   local.cancel.toString(),
                          //                                   style: Theme.of(context)
                          //                                       .textTheme
                          //                                       .bodyText1,
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     )
                          //                   ],
                          //                 );
                          //               });
                          //         },
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Icon(
                          //               Icons.no_accounts_outlined,
                          //               color: Theme.of(context)
                          //                   .colorScheme
                          //                   .primary
                          //                   .withOpacity(0.8),
                          //             ),
                          //             SizedBox(width: 15.0),
                          //             Text(
                          //               CheckLocal.isDirectionRTL(context)
                          //                   ? ' حذف الحساب'
                          //                   : 'Delete',
                          //               style:
                          //                   Theme.of(context).textTheme.bodyText1,
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                    ),
                  ),
                );

            },
          ),
        ),
      ],
    );
  }

  Future<DateTime?> pickDate({
  required bool birthdate,
}) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: birthdate?DateTime(1950,1):DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2100),
  );



}
