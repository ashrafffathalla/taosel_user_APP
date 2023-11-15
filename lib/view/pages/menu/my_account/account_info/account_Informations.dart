import 'package:taosel_user_app/shared/shared_commponents/commponents.dart';
import 'package:taosel_user_app/view/pages/menu/my_account/account_info/password_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/localization/check_local.dart';
import '../../../../../core/size_config/size_config.dart';
import '../../../../../data/local/hiva_helper.dart';
import '../../../../../provider/auth_cubit/auth_cubit.dart';
import '../../../../widgets/background_home.dart';
import '../../../auth/autth_view.dart';
import '../../menu.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'account_info.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({Key? key}) : super(key: key);

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  IconData? deIcon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return BackgroundHome(
      screan: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: Colors.white.withOpacity(0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 10,
              ),
              Center(
                child: Text(
                  local!.accountInfo,
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
                    horizontal: MediaQuery.of(context).size.width * 0.08,
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    InkWell(
                      onTap: () {
                        navigateTo(context, AccountInfo());
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              local.editPersonalInformation,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 25.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Divider(
                      height: 2.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    InkWell(
                      onTap: () {
                         navigateTo(context, PasswordEdit());
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              local.editPassowrd,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 25.sp,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    size: 25.sp,
                    color: Color(0xffFF1212),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      HiveHelper().removeData('deliverDay');
                      HiveHelper().removeData('receiveDay');
                      HiveHelper().removeData('garageID');
                      HiveHelper().removeData('newDateTime');
                      HiveHelper().removeData('newDateTimeTwo');
                      HiveHelper().removeData('branch');
                      HiveHelper().removeData('deliverBranch');
                      HiveHelper().removeData("branchName");
                      HiveHelper().removeData("branchNumber");
                      HiveHelper().removeData("receivePlace");
                      HiveHelper().removeData("token").then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const AuthView()),
                            (route) => false);
                      });
                    },
                    child: Text(
                      local.logout,
                      style: TextStyle(
                          color: Color(0xffFF1212),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
