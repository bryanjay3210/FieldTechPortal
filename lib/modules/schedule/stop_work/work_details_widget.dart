import 'package:flutter/material.dart';
import '../../../utils/utils/theme/global_colors.dart';

class WorkDetails extends StatelessWidget {
  final String title;
  final String detailVal;
  final Color color;

  const WorkDetails({
    Key? key,
    required this.title,
    required this.detailVal,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 2 - 10,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              detailVal,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      );
    });
  }
}
