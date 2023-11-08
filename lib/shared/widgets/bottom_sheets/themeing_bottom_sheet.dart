import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/my_provider.dart';
import '../../controller/language_themeing_provider.dart';

class ThemeingBottomSheet extends StatelessWidget {
  const ThemeingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("light",
                  // AppLocalizations.of(context)!.light,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                provider.appTheme == ThemeMode.light
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("dark",
                  // AppLocalizations.of(context)!.dark,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                provider.appTheme == ThemeMode.dark
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
