import 'package:flutter/material.dart';
import 'package:ft/shared_widgets/shared_button.dart';
import '../../../constants/state_const.dart';
import '../../../core/main/main.dart';
import '../../../models/creditcard/creditcard_dto.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/shared_app_bar.dart';
import '../../../shared_widgets/toasts.dart';
import '../../../utils/utils/theme/global_colors.dart';
import '../shared_widget/actions_button.dart';
import '../stop_work/stop_work.dart';
import 'credit_card.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final creditCardBloc = locator.get<CreditCardBloc>();
  final mainBloc = locator.get<MainBloc>();
  final stopWorkBloc = locator.get<StopWorkBloc>();

  final creditCardNameCtrler = TextEditingController();
  final cardNumber = TextEditingController();
  final cardTypeCtrler = TextEditingController();
  final expDateMonthCtrler = TextEditingController();
  final expDateYearCtrler = TextEditingController();
  final ccvCtrler = TextEditingController();
  final billingZipCtrler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final yearList = [
      ...List<String>.generate(10, (index) => (now.year + index).toString())
    ];
    final monthList = [
      ...List<String>.generate(12, (index) => (index + 1).toString())
    ];
    return Scaffold(
        appBar: appBarShared('Credit Card', null),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color:
                        mainBloc.isDarkTheme$.value ? ftBlackContainer : ftWhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(
                          3.0,
                          3.0,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(children: [
                    textfield('*Card Holder Name', creditCardNameCtrler),
                    const SizedBox(
                      height: 10,
                    ),
                    cardTypeDropDown(cardTypeCtrler, '*Card Type',
                        ['VISA', 'Mastercard', 'American Express', 'Discover']),
                    const SizedBox(
                      height: 10,
                    ),
                    textfield('*Card Number', cardNumber,
                        inputType: TextInputType.number),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('*Expiration Date',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Expanded(child: Text('  Month')),
                            Expanded(child: Text('  Year')),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child:
                                  dropDownWidget(expDateMonthCtrler, monthList),
                            ),
                            Expanded(
                                child:
                                    dropDownWidget(expDateYearCtrler, yearList)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textfield('*CCV', ccvCtrler),
                    const SizedBox(
                      height: 10,
                    ),
                    textfield('*Billing Zip', billingZipCtrler),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
                ),
                const SizedBox(height: 20),
                StreamBuilder<ButtonState>(
                    stream: creditCardBloc.isLoading$,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const SizedBox();
                      }

                      if (snapshot.data == ButtonState.loading) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }

                      return ActionButtons(
                          isEnable: true,
                          text: 'Process',
                          callback: () async {
                            if (creditCardNameCtrler.text.isEmpty ||
                                cardNumber.text.isEmpty ||
                                cardTypeCtrler.text.isEmpty ||
                                expDateMonthCtrler.text.isEmpty ||
                                expDateYearCtrler.text.isEmpty ||
                                ccvCtrler.text.isEmpty ||
                                billingZipCtrler.text.isEmpty) {
                              showToast('Please complete all fields');
                              return;
                            }

                            if (ccvCtrler.text.trim().length < 3) {
                              showToast('CCV character length too short');
                              return;
                            }

                            if (ccvCtrler.text.trim().length > 4) {
                              showToast(
                                  'CCV character length should not exceed to 4');
                              return;
                            }

                            if (expDateYearCtrler.text ==
                                    DateTime.now().year.toString() &&
                                int.parse(expDateMonthCtrler.text) <
                                    DateTime.now().month) {
                              showToast('Expired Card');
                              return;
                            }
                            final res = await creditCardBloc.validateCard({
                              'server': mainBloc.server,
                              'card': cardNumber.text.trim()
                            });
                            if (!res) {
                              showToast('Incorrect card number');
                              return;
                            }

                            final swDto = stopWorkBloc.stopWorkDto;
                            final nrcId = await creditCardBloc
                                .postCreditCardMakeNRC(swDto, context);
                            if (nrcId.isEmpty) {
                              showToast('Error on Make NRC');
                              return;
                            }
                            final ccDto = CreditCardDto(
                                billingZipCtrler.text,
                                "Stripe",
                                swDto.charges![3],
                                'N',
                                creditCardNameCtrler.text,
                                cardNumber.text,
                                cardTypeCtrler.text,
                                expDateMonthCtrler.text +
                                    '/' +
                                    expDateYearCtrler.text.substring(2),
                                ccvCtrler.text,
                                nrcId);

                            await creditCardBloc.postCreditCardCharge(
                                swDto, ccDto, context);
                            if(stopWorkBloc.isClose.value) stopWorkBloc.closeTicket();
                          });
                    }),
              ],
            ),
          ),
        ));
  }

  Widget textfield(String title, TextEditingController controller,
      {TextInputType? inputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18)),
        TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: '',
              isDense: true,
              contentPadding: EdgeInsets.all(13),
            ),
            autovalidateMode: AutovalidateMode.always,
            keyboardType: inputType ?? TextInputType.text,
            validator: (val) {
              if (val == null) return 'This field is required';
            },
            onChanged: (str) {}),
      ],
    );
  }

  Widget cardTypeDropDown(
      TextEditingController ctrler, String title, List<String> str) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        dropDownWidget(ctrler, str)
      ],
    );
  }

  Widget dropDownWidget(TextEditingController ctrler, List<String> str) {
    return PopupMenuButton(
      enabled: true,
      onSelected: (_) async {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
                readOnly: true,
                enabled: false,
                controller: ctrler,
                decoration: InputDecoration(
                    isDense: true, // Added this
                    contentPadding: const EdgeInsets.all(13), // Added this
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ))),
          ),
          const Icon(
            Icons.arrow_drop_down,
          ),
        ],
      ),
      itemBuilder: (context) {
        return List.generate(str.length, (index) {
          return PopupMenuItem(
            onTap: () => ctrler.text = str[index],
            value: index,
            child: Text(str[index]),
          );
        });
      },
    );
  }
}
