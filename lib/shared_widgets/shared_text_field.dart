import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/utils/theme/global_colors.dart';

Widget textFieldShared(
  BuildContext? context, {
  required String title,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool readOnly = true,
  bool? hasUnderlineBorder = false,
  GestureTapCallback? onTap,
  TextEditingController? ctrler,
  BoxConstraints? constraints,
  bool? isTextArea,
  Function(String)? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
        maxLength: isTextArea == true ? null : null,
        maxLines: isTextArea == true ? null : 1,
        keyboardType:
            isTextArea == true ? TextInputType.multiline : TextInputType.text,
        readOnly: readOnly,
        controller: ctrler,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        decoration: InputDecoration(
            constraints: constraints,
            // ignore: prefer_const_constructors
            contentPadding: EdgeInsets.symmetric(vertical: kIsWeb ? -7 : 0),
            isCollapsed: true,
            isDense: true,
            floatingLabelBehavior: isTextArea == true
                ? FloatingLabelBehavior.never
                : FloatingLabelBehavior.auto,
            focusedBorder: hasUnderlineBorder == true
                ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                : InputBorder.none,
            labelText: title,
            floatingLabelStyle: const TextStyle(
                color: Colors.black, height: kIsWeb ? null : null),
            border: hasUnderlineBorder == true
                ? UnderlineInputBorder(borderRadius: BorderRadius.circular(15))
                : InputBorder.none,
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: (kIsWeb)
                        ? const EdgeInsets.only(
                            right: 5, left: 5, top: 5, bottom: 15)
                        : const EdgeInsets.all(13),
                    child: prefixIcon,
                  ),
            suffixIcon: suffixIcon)),
  );
}

Widget textFieldShared2(BuildContext context,
    {String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextEditingController? ctrler,
    bool? readOnly = false,
    GestureTapCallback? onTap,
    bool? isFloatingLabel = true,
    BoxConstraints? constraints,
    bool? isObscureText = false,
    bool? hasBottompadding = true,
    Function(String)? onChanged}) {
  return Padding(
    padding: EdgeInsets.only(bottom: hasBottompadding == true ? 10.0 : 0.0),
    child: TextField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      readOnly: readOnly == true,
      obscureText: isObscureText == true,
      controller: ctrler,
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      decoration: InputDecoration(
          constraints: constraints,
          isDense: true,
          isCollapsed: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          floatingLabelBehavior: isFloatingLabel == true
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(0.0),
            child: suffixIcon,
          ),
          focusedBorder: const OutlineInputBorder()),
    ),
  );
}

Widget textFieldSelection(BuildContext context,
    {String? title,
    String? current,
    GestureTapCallback? onTap,
    bool? hasPrefixIcon}) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: TextFormField(
      initialValue: title,
      style: TextStyle(color: Colors.grey.shade700),
      textAlignVertical: TextAlignVertical.bottom,
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          isCollapsed: true,
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, kIsWeb ? 20 : 10, 0, 5),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          prefixIcon: hasPrefixIcon == null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    current == title
                        ? Icons.radio_button_checked
                        : Icons.circle_outlined,
                  ),
                )
              : null,
          labelStyle: const TextStyle(
            color: Colors.black,
          )),
      readOnly: true,
    ),
  );
}
