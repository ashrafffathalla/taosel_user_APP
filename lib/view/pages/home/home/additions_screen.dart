import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/view/widgets/statusBar.dart';

import '../../../../data/model/showVendor_model.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AdditionsScreen extends StatefulWidget {
  const AdditionsScreen({super.key,required this.index});
  final int index;
  @override
  State<AdditionsScreen> createState() => _AdditionsScreenState();
}

class _AdditionsScreenState extends State<AdditionsScreen> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<HomeCubit>(context);
    return  Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              const StatusBar(),
              SizedBox(
                  width: size.width,
                  height: size.height*0.35,
                  child: cubit.showVendorModel!.data!.categories![0].products![widget.index].media!.isEmpty?Container(
                    child: Icon(Icons.image_not_supported_rounded,size: 60.sp,),
                  ):Image.network(cubit.showVendorModel!.data!.categories![0].products![widget.index].media![0].path.toString())),
              SizedBox(height: size.height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cubit.showVendorModel!.data!.categories![0].products![widget.index].name.toString(),style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600
                  ),),
                  Text(cubit.showVendorModel!.data!.categories![0].products![widget.index].description.toString(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
