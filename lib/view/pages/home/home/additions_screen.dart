import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taosel_user_app/view/widgets/statusBar.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdditionsScreen extends StatefulWidget {
  const AdditionsScreen({super.key, required this.index});

  final int index;

  @override
  State<AdditionsScreen> createState() => _AdditionsScreenState();
}

List checked = [];
bool isChecked = false;

class _AdditionsScreenState extends State<AdditionsScreen> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:size.width*0.05 ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const StatusBar(),
                    SizedBox(
                        width: size.width,
                        height: size.height * 0.35,
                        child: cubit.showVendorModel!.data!.categories![0]
                                .products![widget.index].media!.isEmpty
                            ? Icon(
                                Icons.image_not_supported_rounded,
                                size: 60.sp,
                              )
                            : Image.network(cubit.showVendorModel!.data!
                                .categories![0].products![widget.index].media![0].path
                                .toString())),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cubit.showVendorModel!.data!.categories![0]
                              .products![widget.index].name
                              .toString(),
                          style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          cubit.showVendorModel!.data!.categories![0]
                              .products![widget.index].description
                              .toString(),
                          style:
                              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EG${cubit.showVendorModel!.data!.categories![0].products![widget.index].price}",
                          style:
                              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      cubit.incrementCounter();
                                    },
                                    child: const Icon(Icons.add)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(
                                    cubit.counter.toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      cubit.decrementCounter();
                                    },
                                    child: const Icon(Icons.remove))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Text(local!.additionalServices,
                          style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    ///----------List --------
                    SizedBox(
                      width: size.width,
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: /*widget.checkOrderStepModel!.order!.features!.length*/
                            1,
                        itemBuilder: (BuildContext context, int index) {
                          // List checked = widget.checkOrderStepModel!.order!.features!.toList();
                          //  additionCubit.initialCheckedList();
                          // additionCubit.checkId(1);
                          // additionCubit.checkId(2);
                          ///---------------------
                          // final List<String?>? title =
                          // widget.checkOrderStepModel!.order!.features?.map((e) => e.title).cast<
                          //     String?>().toList();
                          // final List<String?>? price = widget.checkOrderStepModel!.order!
                          //     .features!
                          //     .map((e) =>
                          // "${e.price}")
                          //     .toList();
                          // final List<String?>? daily = widget.checkOrderStepModel!.order!
                          //     .features!.map((e) =>
                          // "${e.daily == false ? "${local.sar.toString()}" : "${locale.sar
                          //     .toString()}/${local.day.toString()}"}")
                          //     .toList();
                          return Directionality(
                                textDirection: TextDirection.ltr,
                                child: CheckboxListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: size.width * 0.02),
                                  activeColor:
                                      Theme.of(context).colorScheme.primaryContainer,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  // Circle Checkbox
                                  value: isChecked,
                                  onChanged: (value) {
                                    // // if(value != null) {
                                    // // additionCubit.checkAddition(index,value);
                                    // checked[index] = value;
                                    // if (checked[index]) {
                                    //   // BlocProvider.of<AdditionsCubit>(context).addAdditionNotCompleted(context, widget.checkOrderStepModel!.order!.features![index]);
                                    //   // checked[index]= false;
                                    // } else {
                                    //   // BlocProvider.of<AdditionsCubit>(context).removeAdditionNotCompleted(
                                    //   //     context, widget.checkOrderStepModel!.order!.features![index]);
                                    //   // additionCubit.checked[index]=false;
                                    //
                                    //   // }
                                    // }
                                    //------------
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("555",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                              )),
                                          Text("ssssssssss",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                              )),
                                        ],
                                      ),
                                      Text(
                                        "ccccc",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                        },
                      ),
                    ),
                    Container(
                        width: size.width,
                        height: 51.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff065BFF), Color(0xff161EEE)], // Define your gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),

                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                            ),
                            onPressed: () {
                            },
                            child: Text(local!.addToCard,style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp
                            ),))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
