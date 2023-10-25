import 'dart:io';
import 'package:taosel_user_app/core/localization/check_local.dart';
import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_cubit.dart';
import 'package:taosel_user_app/shared/shared_commponents/commponents.dart';
import 'package:taosel_user_app/view/pages/auth/autth_view.dart';
import 'package:taosel_user_app/view/pages/auth/otp/otp.dart';
// import 'package:taosel_user_app/view/pages/menu/about_us/privacy_policy/privacy_policy.dart';
import 'package:taosel_user_app/view/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../core/validation/form_validator.dart';
// import '../../../../data/model/country_model.dart';
import '../../../../provider/auth_cubit/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController userNameController;

  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  late TextEditingController phoneController;
  late TextEditingController licenseIdController;

  late TextEditingController emailController;
  bool isAgreeTerms = false;
  final _formKey = GlobalKey<FormState>();
  // CountryModel? countryModel;

  ///Filter
/*
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget ? _appBarTitle;
  void _searchPressed(String title) {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: setTextStyle(),
          controller: _filter,
          decoration: new InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              prefixIcon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'Search...',
              hintStyle: setTextStyle()),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(title);
        _filter.clear();
        this._appBarTitle = null;
      }
    });
  }
  setTextStyle() {
    return TextStyle(color: Colors.white);
  }
 */
  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    licenseIdController = TextEditingController();

    ///Filter
    /*
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          updateFilter(_searchText);
        });
      } else {
        setState(() {
          _searchText = _filter.text;
          updateFilter(_searchText);
        });
      }
    });
  */
  }

/*
  void updateFilter(String text){
    print("updated Text: ${text}");
    filterSearchResults(text);
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(BlocProvider.of<AuthCubit>(context).listCountry as Iterable<String>);
    print("List size : " + dummySearchList.length.toString());
    if(query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if(item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        BlocProvider.of<AuthCubit>(context).listCountry.clear();
        BlocProvider.of<AuthCubit>(context).listCountry.addAll(dummyListData as Iterable<CountryModel>);
      });
      return;
    } else {
      setState(() {
        BlocProvider.of<AuthCubit>(context).listCountry.clear();
        BlocProvider.of<AuthCubit>(context).listCountry.addAll(BlocProvider.of<AuthCubit>(context).listCountry);
      });
    }
  }

 */
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    // BlocProvider.of<AuthCubit>(context).getCountry();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          state.error.contains("path = ''")
              ? showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title:
                          //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
                          Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: SvgPicture.asset(
                                  'assets/images/infoIcon.svg')),
                        ],
                      ),
                      content: Text(
                        CheckLocal.isDirectionRTL(context)
                            ? 'يجب ارفاق صورة رخصة القيادة'
                            : "driver's license must be attached",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  })
              : showDialog(
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
                              child: SvgPicture.asset(
                                  'assets/images/infoIcon.svg')),
                        ],
                      ),
                      content: Text(
                        state.error.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  });
        }
        //  if (state is AuthError) {
        //   showDialog(
        //       context: context,
        //       builder: (_) {
        //         return AlertDialog(
        //           title:
        //           //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Center(
        //                   child: SvgPicture.asset(
        //                       'assets/images/infoIcon.svg')),
        //             ],
        //           ),
        //           content: Text(
        //             state.error.toString(),
        //             style: TextStyle(
        //               fontSize: 14.sp,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         );
        //       });
        // }
        if (state is AuthLoaded) {
          BlocProvider.of<AuthCubit>(context).imagePathFace = "";
          print("Done");
          navigateAndFinish(context, AuthView());
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       Future.delayed(Duration(seconds: 3), () {
          //         Navigator.pop(context);
          //       });
          //       return AlertDialog(
          //         title:
          //             //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
          //             Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Center(
          //                 child: Icon(
          //               Icons.check_circle,
          //               color: Colors.green,
          //               size: 50.sp,
          //             )),
          //           ],
          //         ),
          //         content: Text(
          //           CheckLocal.isDirectionRTL(context)
          //               ? 'تم انشاء البريد الالكتروني بنجاح'
          //               : 'Email has been created successfully',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 16.sp,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       );
          //     });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTP(
                      namePage: "signUp",
                      phone: phoneController.text,
                    )),
          );
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 8.sp),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFeild(
                      controller: userNameController,
                      type: TextInputType.name,
                      label: local!.fullName,
                      pIcon: LineAwesomeIcons.user,
                      validat: (value) =>
                          FormValidator.nameValidate(context, value),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    CustomTextFeild(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: local.emailAddress,
                      pIcon: LineAwesomeIcons.envelope,
                      validat: (value) =>
                          FormValidator.emailValidate(context, value),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    CustomTextFeild(
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(9),
                      ],
                      controller: phoneController,
                      type: TextInputType.phone,
                      label: CheckLocal.isDirectionRTL(context)
                          ? ' الهاتف'
                          : 'Phone',
                      pIcon: LineAwesomeIcons.mobile_phone,
                      validat: (value) =>
                          FormValidator.phoneValidate(context, value),
                      preText: CheckLocal.isDirectionRTL(context)
                          ? '|  966 +'
                          : ' + 966 | ',

                      // sIcon: Padding(
                      //   padding: EdgeInsets.only(top: 15.sp,bottom: 15.sp,),
                      //   child: SvgPicture.asset('assets/images/ksa.svg',),
                      // ),
                    ),

                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    CustomTextFeild(
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10),
                      ],
                      controller: licenseIdController,
                      type: TextInputType.number,
                      label: CheckLocal.isDirectionRTL(context)
                          ? 'رقم الرخصه'
                          : 'License ID',
                      pIcon: LineAwesomeIcons.address_card,
                      validat: (value) =>
                          FormValidator.licenceValidate(context, value),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),

                    ///SELECT Country
                    // Container(
                    //   height: 42.sp,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(25.sp),
                    //       color: Colors.grey.withOpacity(0.1),
                    //       border: Border.all(
                    //           color: Theme.of(context).colorScheme.primary)),
                    //   child: DropdownButtonFormField<CountryModel>(
                    //     elevation: 0,
                    //     isExpanded: true,
                    //     hint: Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal:
                    //               MediaQuery.of(context).size.width * 0.1),
                    //       child: Text(
                    //         local.selectCountry,
                    //       ),
                    //     ),
                    //     // borderRadius: BorderRadius.circular(25),
                    //     iconEnabledColor: Colors.amber,
                    //     decoration: InputDecoration(
                    //         enabledBorder: UnderlineInputBorder(
                    //             borderRadius: BorderRadius.circular(25.sp),
                    //             borderSide: BorderSide(
                    //                 color: Colors.transparent, width: 0.0)),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25.sp),
                    //           gapPadding: 0.0,
                    //         ),
                    //         contentPadding: EdgeInsets.symmetric(
                    //             vertical: 0.0, horizontal: 8.sp)),
                    //     value: countryModel,
                    //     items: cubit.listCountry.map((e) {
                    //       return DropdownMenuItem<CountryModel>(
                    //           value: e, child: Text(e.nationality));
                    //     }).toList(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         countryModel = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: SizeConfig.defaultSize! * 2,
                    // ),

                    CustomTextFeild(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: local.password,
                      pIcon: LineAwesomeIcons.lock,
                      validat: (value) =>
                          FormValidator.passwordValidate(context, value),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    CustomTextFeild(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      label: local.confirmPassword,
                      pIcon: LineAwesomeIcons.lock,
                      validat: (value) => FormValidator.passwordConfirmValidate(
                        context,
                        passwordController.text,
                        value,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: SizeConfig.defaultSize! * 5.3,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              primary: Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context)
                                  .getImage("gallery")
                                  .then((value) {});
                              // showDialog(
                              //     context: context,
                              //     builder: (context) {
                              //       return AlertDialog(
                              //         backgroundColor:
                              //             Theme.of(context).colorScheme.primary,
                              //         content: Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceAround,
                              //           children: [
                              //             // Column(
                              //             //   mainAxisSize: MainAxisSize.min,
                              //             //   children: [
                              //             //     IconButton(
                              //             //       onPressed: () {
                              //             //         BlocProvider.of<AuthCubit>(
                              //             //                 context)
                              //             //             .getImage("camera")
                              //             //             .then((value) {
                              //             //           Navigator.pop(context);
                              //             //         });
                              //             //       },
                              //             //       icon: const Icon(
                              //             //           LineAwesomeIcons.camera),
                              //             //       iconSize: 40,
                              //             //     ),
                              //             //     const Text("Take a Photo")
                              //             //   ],
                              //             // ),
                              //             Column(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: [
                              //                 IconButton(
                              //                   onPressed: () {
                              //                     BlocProvider.of<AuthCubit>(
                              //                             context)
                              //                         .getImage("gallery")
                              //                         .then((value) {
                              //                       Navigator.pop(context);
                              //                     });
                              //                   },
                              //                   icon: const Icon(
                              //                       LineAwesomeIcons.image),
                              //                   iconSize: 40,
                              //                 ),
                              //                 const Text("Gallery")
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       );
                              //     });
                            },
                            icon: cubit.imagePathFace == ""
                                ? SvgPicture.asset('assets/images/upload.svg')
                                : Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: SvgPicture.asset(
                                            'assets/images/che_v.svg'),
                                      ),
                                    ],
                                  ),
                            label: Text(
                              cubit.imagePathFace == ""
                                  ? local.addLicense
                                  : local.uploadedSuccessfully,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 20.sp,
                            height: SizeConfig.defaultSize! * 5,
                            child: cubit.imagePathFace == ""
                                ? Container()
                                : InkWell(
                                    onTap: () {
                                      BlocProvider.of<AuthCubit>(context)
                                          .getImage("gallery")
                                          .then((value) {});
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.amber,
                                    ))),
                      ],
                    ),
                    SizedBox(
                      height: Platform.isIOS
                          ? SizeConfig.defaultSize! * 1
                          : SizeConfig.defaultSize! * .5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                              primarySwatch: Colors.amber,
                              unselectedWidgetColor:
                                  Theme.of(context).colorScheme.primary),
                          child: Transform.scale(
                            scale: 1,
                            child: Checkbox(
                                value: isAgreeTerms,
                                onChanged: (value) {
                                  setState(() {
                                    isAgreeTerms = value!;
                                    print(isAgreeTerms.toString());
                                  });
                                }),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (_) => PrivacyPolicy()));
                          },
                          child: Text(
                            local.agreeTermsAndConditions.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Platform.isIOS
                          ? SizeConfig.defaultSize! * 1
                          : SizeConfig.defaultSize! * 0.5,
                    ),
                    state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : SizedBox(
                            width: SizeConfig.defaultSize! * 30,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate() &&
                                    isAgreeTerms == true) {
                                  await cubit.signUp(
                                    name: userNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    licenseID: licenseIdController.text,
                                    country: 1,
                                    // country: countryModel!.id
                                  );

                                  // BlocProvider.of<LanguageCubit>(context)
                                  //     .selectEngLanguage();
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => OnBoarding()),
                                // );
                              },
                              child: Text(local.signUp),
                            ),
                          ),
                    SizedBox(height: 50.sp),
                    // SizedBox(
                    //   height: SizeConfig.defaultSize! * 0.05,
                    // )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
