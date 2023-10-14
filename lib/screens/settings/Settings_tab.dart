import 'package:flutter/material.dart';
import 'package:todo/screens/settings/theme_bottom_sheet.dart';
import '../../styles/colors.dart';
import 'language_bottom_sheet.dart';
class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("language",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text("English",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("Theme",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showThemeModeBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text("Light",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const LanguageBottomSheet();
        });
  }

  void showThemeModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ThemeModeBottomSheet();
        });
  }
  }