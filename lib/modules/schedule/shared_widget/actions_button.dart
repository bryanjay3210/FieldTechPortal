import 'package:flutter/material.dart';
import '../../../utils/utils/theme/global_colors.dart';

class ActionButtons extends StatelessWidget {
  final String text;
  final bool isEnable;
  final GestureTapCallback callback;
  final Color? color;

  const ActionButtons(
      {Key? key,
      required this.text,
      required this.isEnable,
      required this.callback,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ButtonTheme(
        child: ElevatedButton(
          onPressed: () async {
            if (callback != null) {
              callback();
            }
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(0.0),
            elevation: 3,
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: isEnable ? (color ?? ftPrimaryColor) : ftDisableColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: constraints.maxWidth / 2 - 10,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: isEnable ? ftTextBlack : ftDisableTextColor,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
