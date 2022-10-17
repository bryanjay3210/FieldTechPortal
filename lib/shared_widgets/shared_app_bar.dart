import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ft/modules/schedule/schedule.dart';
import 'package:ft/services/locator.dart';

import '../utils/utils/theme/global_colors.dart';

AppBar appBarShared(String title, VoidCallback? function,) {
  return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: ftGreyDark100),
      foregroundColor: ftWhite,
      title: Text(
        title,
      ),
      actions: [
            Visibility(visible: function != null, child: IconButton(onPressed: function, icon: const Icon(Icons.refresh, color: ftWhite,))),
      ],
      backgroundColor: ftGreyDark100);
}
