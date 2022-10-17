import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/dimension_const.dart';
import '../../shared_widgets/custom_clippers.dart';
import '../../utils/utils/theme/global_colors.dart';

class LoadingScreen extends StatefulWidget {
  final Widget? child;
  const LoadingScreen({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ftLoginBackgroundColor,
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(
                    width: size.width,
                    height: size.height * (widget.child == null ? 0.35 : 0.55),
                    decoration: BoxDecoration(
                      color: Colors.amber[600],
                    ),
                  ),
                ),
              ),
              widget.child == null
                  ? Positioned(
                      top: (size.height / 2) - 25,
                      left: 0,
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: Image.asset('lib/assets/images/main/mdu1.png'),
                      ),
                    )
                  : widget.child!,
            ],
          ),
        ),
      ),
    );
  }
}
