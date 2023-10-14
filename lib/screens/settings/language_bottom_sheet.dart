import 'package:flutter/material.dart';
import '../../styles/colors.dart';
class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  greenBackground ,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // provider.changelang('en');

              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("English",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                  Icons.done,
                  size: 30,
                  color:  Theme.of(context).colorScheme.onBackground,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Arabic",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Icon(
                    Icons.done,
                    size: 30,
                    color: primaryColor)
              ],
            ),
          ),
        ],
      ),
    );
  }
}