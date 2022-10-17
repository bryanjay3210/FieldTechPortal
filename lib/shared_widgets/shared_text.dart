import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

RichText richText2Shared(String first, String second,
    {GestureTapCallback? onTap}) {
  return RichText(
      text: TextSpan(
          text: '$first ',
          style: const TextStyle(color: Colors.black),
          children: [
        TextSpan(
          text: second,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (onTap != null) onTap();
            },
        )
      ]));
}

Text smallTextShared(String str, {Color? color}) {
  return Text(str,
      style: TextStyle(fontSize: 13, color: color ?? Colors.black));
}
