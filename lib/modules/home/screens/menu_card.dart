import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/utils/theme/global_colors.dart';

class MenuCard extends StatelessWidget {
  final String text;
  final String menuIcon;
  final GestureTapCallback callback;
  final bool isDarkTheme;

  const MenuCard(
      {Key? key,
      required this.text,
      required this.menuIcon,
      required this.callback,
      required this.isDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
          child: ElevatedButton(
            onPressed: () {
              if (callback != null) {
                callback();
              }
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Container(
                width: 150.04,
                height: 129.65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: SvgPicture.asset(menuIcon,
                    color: isDarkTheme ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
