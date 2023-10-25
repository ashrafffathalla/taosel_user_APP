import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import '../../../../core/localization/check_local.dart';
import '../../../../core/validation/form_validator.dart';
import '../../../../provider/auth_cubit/auth_state.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_text_feild.dart';
import '../otp/otp.dart';
import '../widget/background.dart';

class ChangePassword extends StatelessWidget {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state is AuthError) {
          //   showDialog(
          //       context: context,
          //       builder: (_) {
          //         return AlertDialog(
          //           content: Text(state.error),
          //         );
          //       });
          // }
          if (state is AuthLoaded) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OTP(
                          namePage: "changePassword",
                        )));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    const BackGround(),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform(
                          transform: CheckLocal.isDirectionRTL(context)
                              ? Matrix4.rotationX(math.pi / 90)
                              : Matrix4.rotationX(math.pi / 120),
                          child: Icon(
                            Icons.sms,
                            size: SizeConfig.defaultSize! * 6,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize! * 1,
                        ),
                        RichText(
                          text: TextSpan(
                            text: local!.changePassword,
                            style: CheckLocal.isDirectionRTL(context)
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        height: SizeConfig.defaultSize! * 0.22),
                            children: <TextSpan>[
                              TextSpan(
                                  text: local.changePasswordDesc,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextFeild(
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(9),
                          ],
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: local.pleaseEnterPhoneNumber,
                          pIcon: Icons.phone_android_outlined,
                          preText: CheckLocal.isDirectionRTL(context)?' | 966 +':' + 966 | ',
                          validat: (value) =>
                              FormValidator.phoneValidate(context, value),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : SizedBox(
                            width: SizeConfig.defaultSize! * 15,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context)
                                        .forget(phone: phoneController.text);
                                  }
                                },
                                child: Text(local.send))),
                    // ElevatedButton.icon(
                    //     onPressed: () {
                    //       BlocProvider.of<LanguageCubit>(context)
                    //           .selectEngLanguage();
                    //     },
                    //     icon: const Icon(Icons.language),
                    //     label: const Text("Change Languagh"))
                  ],
                ),

                CustomBackButton(ontap: () {
                  HiveHelper().removeData("token").then((value) {
                    Navigator.pop(context);
                  });
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
