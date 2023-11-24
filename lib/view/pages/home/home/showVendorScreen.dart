import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:taosel_user_app/view/widgets/statusBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';

class ShowVendorScreen extends StatefulWidget {
  const ShowVendorScreen({Key? key, }) : super(key: key);


  @override
  State<ShowVendorScreen> createState() => _ShowVendorScreenState();
}

class _ShowVendorScreenState extends State<ShowVendorScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    // BlocProvider.of<GetAllVendorsCategoriesCubit>(context).showVendorModel!.data ==null;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<GetAllVendorsCategoriesCubit>(context);
    return BlocConsumer<GetAllVendorsCategoriesCubit, HomeState>(
      listener: (context, state) {
        if(state is ShowVendorLoading){

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is ShowVendorLoading?const Center(child:  CircularProgressIndicator.adaptive()):SingleChildScrollView(
            child: SizedBox(
              height: size.height / 1,
              child: cubit.showVendorModel==null? const Center(child: Text('لا توجد منتجات متاحه حاليا')):Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const StatusBar(),
                    SizedBox(
                      width: size.width,
                      height: size.height*0.35,
                        child: Image.network(cubit.showVendorModel!.data!.media![0].path.toString())),
                    SizedBox(height: size.height*0.02,),
                    ///----------Row Before Divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                        cubit.showVendorModel!.data!.name.toString(),
                        style: TextStyle(
                          color:const Color(0xff0C1D2E),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,color: Colors.yellow,),
                          Text(
                            "${cubit.showVendorModel!.data!.rating}${local!.rate}",
                            style: TextStyle(
                              color:const Color(0xff0C1D2E),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        cubit.showVendorModel!.data!.address.toString(),
                        style: TextStyle(
                          color:const Color(0xff0C1D2E),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],),
                    const Divider(color: Colors.grey,),
                    ///-------------Row After Divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            cubit.showVendorModel!.data!.categories==null?print(cubit.showVendorModel!.data!.categories.toString()):false;
                          },
                          child: Text(
                            "${local.deliver.toString()}${cubit.showVendorModel!.data!.deliveryCharge}${local.eg}",
                            style: TextStyle(
                              color:const Color(0xff0C1D2E),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "${local.time}${cubit.showVendorModel!.data!.deliveryTime}",
                          style: TextStyle(
                            color:const Color(0xff0C1D2E),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],),
                    /// -------------Horizontal categories List------------
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.showVendorModel!.data!.categories!.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {

                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 6.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == index
                                      ? const Color(0xff0C1D2E)
                                      : Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius:
                                BorderRadius.circular(6.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0.sp),
                                child: Text(
                                  cubit.showVendorModel!.data!.categories![index].name.toString(),
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
