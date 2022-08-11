// import 'package:cashir/features/order_status_tabbars/presentation/cubit/tabbar_status_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/utils/app_colors.dart';
//
// class OrderStatusWidget extends StatelessWidget {
//   const OrderStatusWidget(
//       {Key? key, required this.count, required this.text, required this.index})
//       : super(key: key);
//   final int count;
//   final int index;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TabBarStatusCubit, TabBarStatusState>(
//         buildWhen: (previous, current) {
//       return previous != current;
//     }, builder: (context, state) {
//       print(state.index.toString());
//       return Column(
//         children: [
//           Text(
//             count.toString(),
//             style: Theme.of(context).textTheme.headline1?.copyWith(
//                 color:
//                     index == state.index ? AppColors.primary : AppColors.grey),
//           ),
//           Text(text,
//               style: Theme.of(context).textTheme.headline6?.copyWith(
//                   color: index == state.index
//                       ? AppColors.primary
//                       : AppColors.grey)),
//         ],
//       );
//     });
//   }
// }
