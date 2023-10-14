import 'package:flutter/material.dart';
import '../../styles/colors.dart';
class ThemeModeBottomSheet extends StatelessWidget {
  const ThemeModeBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenBackground ,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text("Light",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  Icon(
                    Icons.done,
                    size: 30,
                    color:  primaryColor,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {

              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text("dark",
                      style: Theme.of(context).textTheme.titleSmall),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: primaryColor)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}