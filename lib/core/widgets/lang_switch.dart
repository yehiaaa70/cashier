import 'dart:developer';

import 'package:cashir/config/local/app_localizations.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/language/presentation/bloc/language_bloc.dart';
import 'package:cashir/features/locale/presentation/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../features/login/presentation/cubit/login_cubit.dart';

class LangSwitch extends StatefulWidget {
  const LangSwitch({Key? key}) : super(key: key);

  @override
  State<LangSwitch> createState() => _LangSwitchState();
}

class _LangSwitchState extends State<LangSwitch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ToggleSwitch(
              initialLabelIndex: 0,
              totalSwitches: 2,
              activeBgColor: [AppColors.secondary],
              activeFgColor: Colors.white,
              labels: AppLocalizations.of(context)!.isEnLocale
                  ? [
                      'English',
                      'عربي',
                    ]
                  : [
                      'عربي',
                      'English',
                    ],
              onToggle: (index) {
                if (AppLocalizations.of(context)!.isEnLocale) {
                  if (index == 0) {
                    context.read<LanguageCubit>().toEnglish();
                    print("dnvbsd");

                    // BlocProvider.of<LanguageBloc>(context)
                    //     .add(LoadLanguage(locale: const Locale('en')));

                  } else {
                    context.read<LanguageCubit>().toArabic();

                    // BlocProvider.of<LanguageBloc>(context)
                    //     .add(LoadLanguage(locale: const Locale('ar')));
                  }
                } else {
                  if (index == 1) {
                    // BlocProvider.of<LanguageBloc>(context)
                    //     .add(LoadLanguage(locale: const Locale('en')));
                    context.read<LanguageCubit>().toEnglish();


                  } else {
                    context.read<LanguageCubit>().toArabic();

                    // BlocProvider.of<LanguageBloc>(context)
                    //     .add(LoadLanguage(locale: const Locale('ar')));
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
