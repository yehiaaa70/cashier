import 'package:cashir/core/widgets/app_bar_widget.dart';
import 'package:cashir/features/home_navigator/domain/entities/order_date.dart';
import 'package:cashir/features/home_navigator/presentation/widgets/home_navigation_item.dart';
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
import '../../../order_status_tabbars/presentation/screens/orders_status_tabbars.dart';
import '../cubit/home_navigator_cubit.dart';

class HomeNavigatorScreen extends StatefulWidget {
  const HomeNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
  var _currentTab = TabItem.Orders;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        bottomNavigationBar:
            BlocBuilder<HomeNavigatorCubit, HomeNavigatorState>(
                builder: (context, state) {
          return CurvedNavigationBar(
            index: BlocProvider.of<HomeNavigatorCubit>(context)
                .getCurrentTab
                .index,
            backgroundColor: AppColors.transparent,
            buttonBackgroundColor: AppColors.darkPurple,
            items: [
              Column(
                children: [
                  if (_currentTab != TabItem.History) ...{
                    const SizedBox(
                      height: 16,
                    ),
                  },
                  SvgPicture.asset(ImageAssets.history,
                      width: 25,
                      height: 25,
                      fit: BoxFit.fill,
                      color: _currentTab == TabItem.History
                          ? AppColors.white
                          : Colors.grey[400]),
                  _currentTab != TabItem.History
                      ? const Text("History")
                      : const SizedBox()
                ],
              ),
              Column(
                children: [
                  if (_currentTab != TabItem.Cancelled) ...{
                    const SizedBox(
                      height: 20,
                    ),
                  },
                  SvgPicture.asset(ImageAssets.cancelled,
                      width: 25,
                      height: 25,
                      color: _currentTab == TabItem.Cancelled
                          ? AppColors.white
                          : Colors.grey[400]),
                  _currentTab != TabItem.Cancelled
                      ? const Text("cancelled")
                      : const SizedBox()
                ],
              ),
              Column(
                children: [
                  if (_currentTab != TabItem.Orders) ...{
                    const SizedBox(
                      height: 20,
                    ),
                  },
                  SvgPicture.asset(ImageAssets.orders,
                      width: 25,
                      height: 25,
                      color: _currentTab == TabItem.Orders
                          ? AppColors.white
                          : Colors.grey[400]),
                  _currentTab != TabItem.Orders
                      ? const Text("orders")
                      : const SizedBox()
                ],
              ),
              Column(
                children: [
                  if (_currentTab != TabItem.Offers) ...{
                    const SizedBox(
                      height: 20,
                    ),
                  },
                  SvgPicture.asset(ImageAssets.offers,
                      width: 25,
                      height: 25,
                      color: _currentTab == TabItem.Offers
                          ? AppColors.white
                          : Colors.grey[400]),
                  _currentTab != TabItem.Offers
                      ? const Text("offers")
                      : const SizedBox()
                ],
              ),
              Column(
                children: [
                  if (_currentTab != TabItem.Logout) ...{
                    const SizedBox(
                      height: 20,
                    ),
                  },
                  SvgPicture.asset(ImageAssets.logout,
                      width: 25,
                      height: 25,
                      color: _currentTab == TabItem.Logout
                          ? AppColors.white
                          : Colors.grey[400]),
                  _currentTab != TabItem.Logout
                      ? const Text("logout")
                      : const SizedBox()
                ],
              ),
            ],
            onTap: (index) {
              if (_currentTab.index != index) {
                _selectTab(TabItem.values[index]);
              }
            },
          );
        }),
        body: bottomNavigationBarViews()[_currentTab.index]);
  }

  List<Widget> bottomNavigationBarViews() {
    return [
      const HistoryScreen(),
      const CancelledOrdersTabBarScreen(),
      const OrderStatusTabBar(),
      const OffersScreen(),
      const Center(child: Text("You have been signed out"))
    ];
  }
}
