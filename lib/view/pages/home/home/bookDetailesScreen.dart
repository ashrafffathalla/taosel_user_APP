import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              border: Border.all(
                color: Colors.black,
              )
            ),
            child: Column(
              children: [
                Text('تفاصيل الطلب',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,

                ),),
                Row(
                  children: [
                    Text(cubit.showVendorModel!.data!.name.toString()),
                    // Text(cubit.showVendorModel!.data!.),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
