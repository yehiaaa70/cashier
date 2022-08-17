import 'package:cashir/core/utils/app_colors.dart';
import 'package:cashir/features/language/presentation/bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangSwitch extends StatefulWidget {
  const LangSwitch({Key? key}) : super(key: key);

  @override
  State<LangSwitch> createState() => _LangSwitchState();
}

class _LangSwitchState extends State<LangSwitch> {
  bool lang = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('en'),
        Switch(
          value: lang,
          onChanged: (value) {
            setState(() {
              lang = value;
              if (lang == false) {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LoadLanguage(locale: const Locale('en')));
              } else {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LoadLanguage(locale: const Locale('ar')));
              }
            });
          },
          activeColor: AppColors.primary,
        ),
        const Text('ar'),
      ],
    );
  }
}
