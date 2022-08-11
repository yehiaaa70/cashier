import 'package:cashir/core/widgets/app_bar_widget.dart';
import 'package:cashir/features/home_navigator/presentation/widgets/home_navigation_item.dart';
import 'package:cashir/features/offers/presentation/screens/offers_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../cancelled_orders_tabbar/presentation/screens/cancelled_orders_tabbar_screen.dart';
import '../../../history/presentation/screen/history_screen.dart';
import '../../../order_status_tabbars/presentation/screens/orders_status_tabbars.dart';
import '../cubit/home_navigator_cubit.dart';

class HomeNavigatorScreen extends StatelessWidget {
  const HomeNavigatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          backgroundColor: AppColors.transparent,
          buttonBackgroundColor: AppColors.darkPurple,
          items: const [
            HomeNavigationItem(
                tabItem: TabItem.History,
                imageAsset: ImageAssets.history,
                text: AppStrings.history),
            HomeNavigationItem(
                tabItem: TabItem.Cancelled,
                imageAsset: ImageAssets.cancelled,
                text: AppStrings.cancelled),
            HomeNavigationItem(
                tabItem: TabItem.Orders,
                imageAsset: ImageAssets.orders,
                text: AppStrings.orders),
            HomeNavigationItem(
                tabItem: TabItem.Offers,
                imageAsset: ImageAssets.offers,
                text: AppStrings.offers),
            HomeNavigationItem(
                tabItem: TabItem.Logout,
                imageAsset: ImageAssets.logout,
                text: AppStrings.logout),
          ],
          onTap: (index) {
            if (BlocProvider.of<HomeNavigatorCubit>(context)
                    .getCurrentTab
                    .index !=
                index) {
              BlocProvider.of<HomeNavigatorCubit>(context)
                  .setCurrentTab(TabItem.values[index]);
            }
          },
        ),
        body: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState>(
            builder: (context, state) {
          return bottomNavigationBarViews()[state.currentTab.index];
        }));
  }

  List<Widget> bottomNavigationBarViews() {
    return [
      const HistoryScreen(),
      const CancelledOrdersTabbarScreen(),
      const OrderStatusTabBar(),
      const OffersScreen(),
      const Text("hna")
    ];
  }
}
