import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';

import '../../../constants/dimension_const.dart';
import '../../../core/login/login.dart';
import '../../../core/main/main.dart';
import '../../../services/locator.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final loginBloc = locator.get<LoginBloc>();
    final mainBloc = locator.get<MainBloc>();
    return Container(
      color: mainBloc.isDarkTheme$.value ? ftBlackBackground : ftWhite,
      child: Stack(
        children: [
          ClipPath(
              child: Container(
                color: ftGreyDark100,
                height: mqHeight(context) * .45,
                width: mqWidth(context),
              ),
              clipper: TriangleClipper()),
          Container(
            padding: const EdgeInsets.only(top: 50, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.amber[600],
                      fontFamily: 'Sfprodisplay',
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loginBloc.techInfo.TechName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Sfprodisplay",
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset("lib/assets/images/home/icon_email2.svg"),
                        const SizedBox(width: 5),
                        FutureBuilder<dynamic>(
                            future: loginBloc.getLocalCredential(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * .45,
                                child: Text(
                                  snapshot.data!['username'].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFA09F9E),
                                    fontFamily: "Sfprodisplay",
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 80,
              right: 0,
              child: SizedBox(
                width: size.width * .45,
                child: const Image(
                  image: AssetImage("lib/assets/images/home/headerimg2.png"),
                ),
              )),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - (size.height * .45));

    path.quadraticBezierTo(
        size.height - (size.height * .90), size.height, 20, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
