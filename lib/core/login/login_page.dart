import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/loading_screen.dart';
import 'package:ft/shared_widgets/shared_button.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants/app_info_const.dart';
import '../../constants/server_const.dart';
import '../../constants/state_const.dart';
import '../../services/locator.dart';
import '../../utils/utils/theme/global_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginBloc = locator.get<LoginBloc>();

  final userName = TextEditingController();
  final password = TextEditingController();
  var isRememberMe$ = BehaviorSubject<bool>.seeded(true);
  var isHidden$ = BehaviorSubject<bool>.seeded(true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userName.text = await locator.get<LoginBloc>().inputUserName();
    });
  }

  var idx = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // userName.text = 'cvergara2@myinternetsupport.com';
    // password.text = 'Password1_';
    //   userName.text = 'developer-test@myinternetsupport.com';
    // password.text = 'GreenApple123\$';
    return Scaffold(
        body: LoadingScreen(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: size.height * .90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    child: Image.asset('lib/assets/images/main/mdu1.png'),
                  ),
                ],
              ),
              StreamBuilder<ButtonState>(
                  stream: loginBloc.loginState$,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }

                    if (snapshot.data == ButtonState.loading) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }

                    return Container(
                      alignment: Alignment.center,
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                          child: Container(
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white10.withOpacity(0.65),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // dropDownServerWidget(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextFormField(
                                          controller: userName,
                                          decoration: const InputDecoration(
                                            hintText: "Username",
                                            icon: Icon(
                                                Icons.person_outline_outlined,
                                                color: Palette.iconColor),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFA09F9E)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF32333D)),
                                            ),
                                          ),
                                        ),
                                        StreamBuilder<bool>(
                                            stream: isHidden$,
                                            builder: (context, snapshot) {
                                              if (snapshot.data == null) {
                                                return const SizedBox();
                                              }
                                              final data = snapshot.data;
                                              return TextFormField(
                                                controller: password,
                                                obscureText: data!,
                                                decoration: InputDecoration(
                                                  hintText: "Password",
                                                  icon: const Icon(
                                                      Icons.lock_outlined,
                                                      color: Palette.iconColor),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFA09F9E)),
                                                  ),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF32333D)),
                                                  ),
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      isHidden$.add(!data);
                                                    },
                                                    child: data
                                                        ? const Icon(Icons
                                                            .visibility_off_outlined)
                                                        : const Icon(
                                                            Icons
                                                                .remove_red_eye,
                                                            color: Palette
                                                                .iconColor,
                                                          ),
                                                  ),
                                                ),
                                              );
                                            }),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        StreamBuilder<bool>(
                                            stream: isRememberMe$,
                                            builder: (context, snapshot) {
                                              if (snapshot.data == null) {
                                                return const SizedBox();
                                              }
                                              return buildRemember();
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: StretchableButton(
                                            text: 'Login',
                                            onPressed: () async {
                                              await loginBloc.onLogin({
                                                'username': userName.text,
                                                'password': password.text,
                                                'server': idx,
                                                'rememberMe':
                                                    isRememberMe$.value
                                              }, context, () {
                                                Navigator.of(context)
                                                    .pushReplacementNamed('/');
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 50),
                height: 120,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Field Tech Portal',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'version $versionNum',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF50555C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget dropDownServerWidget() {
    return PopupMenuButton(
      onSelected: (_) async {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(servers.elementAt(idx).values.elementAt(1),
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ],
      ),
      itemBuilder: (context) {
        return List.generate(4, (index) {
          return PopupMenuItem(
            onTap: () => setState(() {
              idx = index;
            }),
            value: index,
            child: Text(servers.elementAt(index).values.elementAt(1),
                style: const TextStyle(color: Colors.black)),
          );
        });
      },
    );
  }

  Widget buildRemember() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: const Color(0xFFA09F9E)),
          child: Checkbox(
            value: isRememberMe$.value,
            checkColor: Colors.white,
            activeColor: const Color(0xFFA09F9E),
            onChanged: (value) {
              isRememberMe$.add(value!);
            },
          ),
        ),
        const Text(
          'Remember me?',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: 45,
      decoration: BoxDecoration(
        color: ftPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
      ),
    );
  }
}
