import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:taosel_user_app/view/widgets/statusBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';

class ShowVendorScreen extends StatefulWidget {
  const ShowVendorScreen({Key? key, required this.vendorId}) : super(key: key);
  final int vendorId;

  @override
  State<ShowVendorScreen> createState() => _ShowVendorScreenState();
}

class _ShowVendorScreenState extends State<ShowVendorScreen> {
  @override
  void initState() {
    // BlocProvider.of<GetAllVendorsCategoriesCubit>(context).showVendorModel!.data ==null;
    BlocProvider.of<GetAllVendorsCategoriesCubit>(context)
        .showVendor(widget.vendorId);
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<GetAllVendorsCategoriesCubit>(context).showVendorModel;
    return BlocConsumer<GetAllVendorsCategoriesCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          body: state is ShowVendorLoading || cubit!.data==null?const Center(child:  CircularProgressIndicator.adaptive()):SingleChildScrollView(
            child: SizedBox(
              height: size.height / 1,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const StatusBar(),
                  SizedBox(
                    width: size.width,
                    height: size.height*0.35,
                      child: Image.network(
                          cubit.data!.media![0].path.toString())),
                  SizedBox(height: size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text(
                      cubit.data!.name.toString(),
                      style: TextStyle(
                        color: Color(0xff0C1D2E),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(

                      children: [
                        const Icon(Icons.star,color: Colors.yellow,),
                        Text(
                          cubit.data!.rating.toString(),
                          style: TextStyle(
                            color: Color(0xff0C1D2E),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      cubit.data!.address.toString(),
                      style: TextStyle(
                        color: Color(0xff0C1D2E),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
