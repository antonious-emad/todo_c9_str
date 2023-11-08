import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../../shared/controller/language_themeing_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/widgets/bottom_sheets/language_bottom_sheet.dart';
import '../../shared/widgets/bottom_sheets/themeing_bottom_sheet.dart';
import '../../shared/widgets/setting_box.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          SizedBox(
            height: 20,
          ),
          SettingBox(
            text: provider.languageCode == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
            function: () {
              showLanguageBottomSheet(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SettingBox(
            text: provider.appTheme == ThemeMode.light ? AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark,
            function: () {
              showThemeingBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  showThemeingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      context: context,
      builder: (context) => const ThemeingBottomSheet(),
    );
  }

  showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}
