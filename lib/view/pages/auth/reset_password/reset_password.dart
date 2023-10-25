import 'package:taosel_user_app/core/size_config/size_config.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:math' as math;
import '../../../../core/localization/check_local.dart';
import '../../../../core/validation/form_validator.dart';
import '../../../../data/local/hiva_helper.dart';
import '../../../../provider/auth_cubit/auth_state.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_text_feild.dart';
import '../reset_done/reset_done.dart';
import '../reset_error/reset_error.dart';
import '../widget/background.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final phoneController = TextEditingController();
  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            HiveHelper().removeData("token").then((value) {

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ResetError()),
                  (route) => false);
            });
          }
          if (state is AuthLoaded) {
            HiveHelper().removeData("token").then((value) {
              HiveHelper().removeData("sendAgainToken");
              HiveHelper().removeData("tokenRegister");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ResetDone(),
                  ),
                  (route) => false);
            });
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
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
                              LineAwesomeIcons.researchgate,
                              size: SizeConfig.defaultSize! * 6,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.defaultSize! * 1,
                          ),
                          RichText(
                            text: TextSpan(
                              text: local!.resetPassword,
                              style: CheckLocal.isDirectionRTL(context)
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 20,
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
                                          height:
                                              SizeConfig.defaultSize! * 0.22),
                              children: <TextSpan>[
                                TextSpan(
                                    text: local.resetDesc,
                                    style:  TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 1.5,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 10.sp),
                        child: CustomTextFeild(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: local.password,
                          pIcon: LineAwesomeIcons.lock,
                          validat: (value) =>
                              FormValidator.passwordValidate(context, value),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 10.sp),
                        child: CustomTextFeild(
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          label: local.confirmPassword,
                          pIcon: LineAwesomeIcons.lock,
                          validat: (value) =>
                              FormValidator.passwordConfirmValidate(
                                  context, passwordController.text, value),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      SizedBox(
                          width: SizeConfig.defaultSize! * 15,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .changepass(
                                          pass: passwordController.text);
                                }
                              },
                              child: Text(local.resetButton))),
                    ],
                  ),
                ),
                CustomBackButton(ontap: () {
                  Navigator.pop(context);
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
