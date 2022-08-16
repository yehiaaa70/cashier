import 'dart:developer';

import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/core/widgets/app_bar_widget.dart';
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:cashir/features/home_navigator/presentation/widgets/home_navigation_item.dart';
import 'package:cashir/features/login/data/data_sources/call_api.dart';
import 'package:cashir/features/login/data/models/user_model.dart';
import 'package:cashir/features/offers/presentation/screens/offers_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../cancelled_orders_tabbar/presentation/screens/cancelled_orders_tabbar_screen.dart';
import '../../../history/presentation/screen/history_screen.dart';
import '../../../logout/presentation/pages/logout.dart';
import '../../../order_status_tabbars/presentation/screens/orders_status_tabbars.dart';
import '../cubit/home_navigator_cubit.dart';

class HomeNavigatorScreen extends StatefulWidget {
  const HomeNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
   int _currentTab = 2;
   @override
   void initState() {
     super.initState();
     BlocProvider.of<HomeNavigatorCubit>(context).getAllOrders();
     init();
   }

   Future init() async {
     final userToken = await SecureStorage.getToken();
     log('toooooken ${userToken.toString()}');
   }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigatorCubit,HomeNavigatorState>(
      builder: (BuildContext context, state) {
        if(state is AllOrdersLoading){
          return Container(
            color: AppColors.background,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        }else if(state  is AllOrdersLoaded){
          // context.read<HomeNavigatorCubit>().getHistoryOrders();
          return Scaffold(
              appBar:  AppBarWidget(currentTab: _currentTab,),
              bottomNavigationBar: CurvedNavigationBar(

                index:2,
                backgroundColor: AppColors.transparent,
                buttonBackgroundColor: AppColors.darkPurple,
                onTap: (index) {
                  setState(() => _currentTab = index);
                },
                items: [
                  Column(
                    children: [
                      if (_currentTab != 0) ...{
                        const SizedBox(
                          height: 16,
                        ),
                      },
                      SvgPicture.asset(ImageAssets.history,
                          width: 25,
                          height: 25,
                          fit: BoxFit.fill,
                          color: _currentTab == 0
                              ? AppColors.white
                              : Colors.grey[400]),
                      _currentTab != 0
                          ? const Text("History")
                          : const SizedBox()
                    ],
                  ),
                  Column(
                    children: [
                      if (_currentTab != 1) ...{
                        const SizedBox(
                          height: 20,
                        ),
                      },
                      SvgPicture.asset(ImageAssets.cancelled,
                          width: 25,
                          height: 25,
                          color: _currentTab == 1
                              ? AppColors.white
                              : Colors.grey[400]),
                      _currentTab != 1
                          ? const Text("cancelled")
                          : const SizedBox()
                    ],
                  ),
                  Column(
                    children: [
                      if (_currentTab != 2) ...{
                        const SizedBox(
                          height: 20,
                        ),
                      },
                      SvgPicture.asset(ImageAssets.orders,
                          width: 25,
                          height: 25,
                          color: _currentTab == 2
                              ? AppColors.white
                              : Colors.grey[400]),
                      _currentTab != 2
                          ? const Text("orders")
                          : const SizedBox()
                    ],
                  ),
                  Column(
                    children: [
                      if (_currentTab !=3) ...{
                        const SizedBox(
                          height: 20,
                        ),
                      },
                      SvgPicture.asset(ImageAssets.offers,
                          width: 25,
                          height: 25,
                          color: _currentTab == 3
                              ? AppColors.white
                              : Colors.grey[400]),
                      _currentTab != 3
                          ? const Text("offers")
                          : const SizedBox()
                    ],
                  ),
                  Column(
                    children: [
                      if (_currentTab != 4) ...{
                        const SizedBox(
                          height: 20,
                        ),
                      },
                      SvgPicture.asset(ImageAssets.logout,
                          width: 25,
                          height: 25,
                          color: _currentTab == 4
                              ? AppColors.white
                              : Colors.grey[400]),
                      _currentTab != 4
                          ? const Text("logout")
                          : const SizedBox()
                    ],
                  ),
                ],

              ),
              body: [
                HistoryScreen( stateOrderList: [
                  context.read<HomeNavigatorCubit>().deliveryHistory,
                  context.read<HomeNavigatorCubit>().takeAwayHistory,
                  context.read<HomeNavigatorCubit>().canceledHistory,
                  context.read<HomeNavigatorCubit>().rejectedHistory,
                ]),
                CancelledOrdersTabBarScreen(
                  stateOrderList: [
                    context.read<HomeNavigatorCubit>().canceled,
                    context.read<HomeNavigatorCubit>().rejected,
                  ],
                ),
                OrderStatusTabBar(stateOrderList: [
                  context.read<HomeNavigatorCubit>().pending,
                  context.read<HomeNavigatorCubit>().progress,
                  context.read<HomeNavigatorCubit>().completed,
                  context.read<HomeNavigatorCubit>().canceled,
                  context.read<HomeNavigatorCubit>().rejected,
                ]),
                const OffersScreen(),
                const LogoutScreen()
              ][_currentTab]);
        }else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.red,
            ),
          );
        }
      },
    );
  }
}
