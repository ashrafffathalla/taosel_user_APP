/*import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../view/pages/home/additions_car/additions_car_screen.dart';
import '../../view/pages/home/cars/cars_screan.dart';
import '../../view/pages/home/payment/payment.dart';
import '../../view/pages/home/search/search.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<int> {
  NavigatorCubit() : super(0);
  int nextPage = 1;
  PageController pageController = PageController();

  final List<Widget> pageList = const [
    Search(),
    CarsScrean(),
    AdditionsCarScreen(),
    PaymentScrean(),
  ];

  pushScrean() {
    emit(state + 1);
    nextPage = state;
    pageController.animateToPage(state,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.linear);
    emit(state);
  }

  // pushScreans(context) {
  //   emit(state + 1);
  //   nextPage = state;
  //   pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
  //   emit(state);
  // }
  backScreen() {
    emit(state - 1);
    nextPage = state;
    pageController.animateToPage(state,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.linear);
    emit(state);
  }

  //
  // backPreviousScreen(context) {
  //   emit(state - 1);
  //   nextPage = state;
  //   Navigator.pop(context);
  //   emit(state);
  // }

  start() {
    emit(0);
    nextPage = state;
    emit(state);
  }

  cancel() {
    emit(0);
    nextPage = state;
    pageController.animateToPage(state,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.linear);
    emit(state);
  }
}*/
