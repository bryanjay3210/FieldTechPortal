import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/shared_widgets/shared_dialog.dart';
import 'package:ft/shared_widgets/toasts.dart';
import 'package:ft/utils/utils/location/location.dart';
import '../../../constants/state_const.dart';
import '../../../core/login/login.dart';
import '../../../models/event/stop_work_dto.dart';
import '../../../models/trip_rate/trip_rate.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/shared_app_bar.dart';
import '../../../utils/utils/datetime/date_convert.dart';
import '../../../utils/utils/theme/global_colors.dart';
import '../credit_card/credit_card.dart';
import '../shared_widget/actions_button.dart';
import '../start_work/start_work.dart';
import 'stop_work.dart';
import 'work_details_widget.dart';

class StopWorkPage extends StatefulWidget {
  const StopWorkPage({Key? key}) : super(key: key);

  @override
  State<StopWorkPage> createState() => _StopWorkPageState();
}

class _StopWorkPageState extends State<StopWorkPage> {
  bool hasSignature = false;
  final startWorkBloc = locator.get<StartWorkBloc>();
  final stopWorkBloc = locator.get<StopWorkBloc>();
  final creditCardBloc = locator.get<CreditCardBloc>();

  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final mainBloc = locator.get<MainBloc>();
  final loginBloc = locator.get<LoginBloc>();

  final workPerformedController = TextEditingController();
  final overageReasonController = TextEditingController();
  final rateController = TextEditingController();
  final tripController = TextEditingController();
  final otherController = TextEditingController();
  final totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerEvent = serviceCallDetailsBloc.currentCustomerEvent;
    final customer = serviceCallDetailsBloc.currentCustomer;
    final selectedEvent = serviceCallDetailsBloc.selectedEvent;
    String assetLocation = 'lib/assets/images/schedule/';
    String startTime = dateToTimeStringhhmmaa(startWorkBloc.timeStarted);
    String endTimeHhmmaa = dateToTimeStringhhmmaa(stopWorkBloc.timeStopped);
    String endTimeHm = dateToTimeStringhm(stopWorkBloc.timeStopped);
    final isDarkTheme = mainBloc.isDarkTheme$.value;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
            appBar: appBarShared('Stop Work', null),
            body: FutureBuilder<TripRate>(
                future: stopWorkBloc.getTechnicianTripRate({
                  'server': mainBloc.server,
                  'techId': mainBloc.login.UserID,
                  'startLat': serviceCallDetailsBloc.startTravel?.latitude == null ? serviceCallDetailsBloc.location.firstWhere((element) => element.Type == 'Start Travel').Latitude : serviceCallDetailsBloc.startTravel!.latitude,
                  'startLong': serviceCallDetailsBloc.startTravel?.longitude == null ? serviceCallDetailsBloc.location.firstWhere((element) => element.Type == 'Start Travel').Longitude : serviceCallDetailsBloc.startTravel!.longitude,
                  'stopLat': serviceCallDetailsBloc.startTravel?.latitude == null ? serviceCallDetailsBloc.location.firstWhere((element) => element.Type == 'Stop Travel').Latitude : serviceCallDetailsBloc.startTravel!.latitude,
                  'stopLong': serviceCallDetailsBloc.startTravel?.longitude == null ? serviceCallDetailsBloc.location.firstWhere((element) => element.Type == 'Start Travel').Longitude : serviceCallDetailsBloc.startTravel!.longitude
                }, context),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  final tripRate = snapshot.data;
                  tripController.text = tripRate!.TotalCharge;
                  rateController.text = (((startWorkBloc.timeCount.inSeconds *
                                  double.parse(loginBloc.tech.BillRate)) /
                              60) /
                          60)
                      .toStringAsFixed(2);

                  void calculate() {
                    final rate = double.parse(rateController.text);
                    final trip = double.parse(tripRate.TotalCharge);

                    final other = otherController.text.trim().isEmpty
                        ? 0.0
                        : double.parse(otherController.text);
                    totalController.text =
                        (rate + trip + other).toStringAsFixed(2);
                    if (stopWorkBloc.currentCustomerSignature.value.length >
                        6000) {
                      stopWorkBloc.clearCurrentSignature();
                    }
                  }

                  stopWorkDto() async {
                    final position = await physicalLocation();
                    final d = DateTime.now();
                    final dto = StopWorkDto(
                      mainBloc.server,
                      eventId: selectedEvent.EventID,
                      customerId: customerEvent.CustomerID,
                      techId: mainBloc.login.CustomerID,
                      date: "${d.month}/${d.day}/${d.year}",
                      time: endTimeHm,
                      gps: position,
                      workPerformed: workPerformedController.text,
                      overageReason: overageReasonController.text,
                      timeSpent:
                          durationToTimeStringhm(startWorkBloc.timeCount),
                      charges: [
                        rateController.text.isEmpty ? '0' : rateController.text,
                        tripController.text.isEmpty ? '0' : tripController.text,
                        otherController.text.isEmpty
                            ? '0'
                            : otherController.text,
                        totalController.text.isEmpty
                            ? '0'
                            : totalController.text,
                      ],
                      ticketId: selectedEvent.TicketID,
                    );
                    stopWorkBloc.stopWorkDto = dto;
                  }

                  bool overageAlert() {
                    final original =
                        jsTimeToDateTime(customerEvent.EventEndTime)
                            .difference(
                                jsTimeToDateTime(customerEvent.EventStartTime))
                            .inMinutes;
                    final actual = startWorkBloc.timeCount.inMinutes;
                    return original < actual;
                  }

                  bool canSave() {
                    if (totalController.text.isEmpty) {
                      showToast('No total');
                      return false;
                    } else if (double.parse(totalController.text) < 1) {
                      showToast('0 total');
                      return false;
                    }
                    if (workPerformedController.text.trim().isEmpty) {
                      showToast('Work performance is empty');
                      return false;
                    }
                    if (overageReasonController.text.trim().isEmpty &&
                        overageAlert()) {
                      showToast('Overage Reason is empty');
                      return false;
                    }

                    return true;
                  }

                  calculate();

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            height: 40.0,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: ftPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: Text(selectedEvent.TicketID,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: ftTextBlack,
                                        ))))),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDarkTheme ? ftBlackContainer : ftWhite,
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          flex: 0,
                                          child: Icon(Icons.account_circle)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          customer.Name,
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(height: 1),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 0,
                                              child: SvgPicture.asset(
                                                '${assetLocation}icon_location.svg',
                                                width: 20,
                                                color: ftIconGrey,
                                              )),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              customer.Address,
                                              style: const TextStyle(
                                                color: ftTextColorBody,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 0,
                                              child: SvgPicture.asset(
                                                '${assetLocation}icon_building_ticket.svg',
                                                width: 20,
                                                color: ftIconGrey,
                                              )),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              customer.BuildingName,
                                              style: const TextStyle(
                                                color: ftTextColorBody,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 0,
                                            child: SvgPicture.asset(
                                              '${assetLocation}installer_icon_ticket.svg',
                                              width: 20,
                                              color: ftIconGrey,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              customerEvent == null
                                                  ? ''
                                                  : customerEvent.EventType,
                                              style: const TextStyle(
                                                color: ftTextColorBody,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isDarkTheme ? ftBlackContainer : ftWhite,
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
                          child: Column(
                            children: <Widget>[
                              Wrap(
                                spacing: 20,
                                runSpacing: 0,
                                children: <Widget>[
                                  WorkDetails(
                                      title: 'Start',
                                      detailVal: startTime,
                                      color:
                                          isDarkTheme ? ftWhite : ftTextBlack),
                                  WorkDetails(
                                      title: 'End',
                                      detailVal: endTimeHhmmaa,
                                      color:
                                          isDarkTheme ? ftWhite : ftTextBlack),
                                  WorkDetails(
                                      title: 'Spent Time',
                                      detailVal: durationToTimeStringhm(
                                          startWorkBloc.timeCount),
                                      color:
                                          isDarkTheme ? ftWhite : ftTextBlack),
                                  WorkDetails(
                                      title: 'Paused Time',
                                      detailVal: durationToTimeStringhm(
                                          startWorkBloc.pausedTime),
                                      color:
                                          isDarkTheme ? ftWhite : ftTextBlack),
                                  WorkDetails(
                                      title: 'Technician Rate',
                                      detailVal: '\$${loginBloc.tech.BillRate}',
                                      color:
                                          isDarkTheme ? ftWhite : ftTextBlack),
                                  WorkDetails(
                                      title: 'Travel Distance',
                                      detailVal: '${tripRate.Miles} Mile/s',
                                      color:
                                          isDarkTheme ? ftWhite : ftTextBlack),
                                ],
                              ),
                              const Divider(
                                height: 50,
                                thickness: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Work Performance',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                  TextFormField(
                                      controller: workPerformedController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter work performed...',
                                      ),
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Reason for changing expected time';
                                        }
                                        return null;
                                      },
                                      onChanged: (str) {}),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (overageAlert())
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Overage Reason',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                    TextFormField(
                                        controller: overageReasonController,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter overage reason...',
                                        ),
                                        validator: (val) {
                                          if (val == null) {
                                            return 'you have exceeded the expected work time';
                                          }
                                          if (val.isEmpty) {
                                            return 'you have exceeded the expected work time';
                                          }
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        onChanged: (str) {}),
                                  ],
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Rate:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        const Text(
                                          '\$',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller: rateController,
                                            readOnly: true,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Trip:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        const Text(
                                          '\$',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            readOnly: true,
                                            controller: tripController,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Other:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        const Text(
                                          '\$',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller: otherController,
                                            onChanged: (t) {
                                              calculate();
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Total:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        const Text(
                                          '\$',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            readOnly: true,
                                            controller: totalController,
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Adjustments will clear customer signature',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: ftTextGreyLight),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final total = totalController.text;
                            if (total.isEmpty) {
                              showToast('Total is empty');
                              return;
                            } else if (double.parse(total) < 0 ||
                                double.parse(total) == 0) {
                              showToast('Total is \$0');
                              return;
                            }

                            await stopWorkDto();
                            Navigator.pushNamed(context, 'signature');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDarkTheme ? ftBlackContainer : ftWhite,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 20),
                                  child: const Text('Customer Signature',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 1,
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  height: 160,
                                  child: Center(
                                      child: StreamBuilder<Uint8List>(
                                          stream: stopWorkBloc
                                              .currentCustomerSignature,
                                          builder: (context, snapshot) {
                                            final data = snapshot.data;
                                            if (data == null ||
                                                data.length < 7000) {
                                              hasSignature = false;
                                              return const Text(
                                                  'Click here for customer signature',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ));
                                            }
                                            hasSignature = true;
                                            return Center(
                                                child: Image.memory(data));
                                          })),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // StreamBuilder<bool>(
                        //   initialData: false,
                        //   stream: stopWorkBloc.isClose,
                        //   builder: (context, snapshot) {
                        //     return CheckboxListTile(
                        //       title: const Text('Close this ticket'),
                        //       value: snapshot.data,
                        //       onChanged: (value){
                        //         stopWorkBloc.isClose.add(!stopWorkBloc.isClose.value);
                        //       },
                        //       controlAffinity: ListTileControlAffinity.leading,
                        //     );
                        //   },
                        // ),
                        const SizedBox(
                          height: 40,
                        ),
                        StreamBuilder<ButtonState>(
                            stream: stopWorkBloc.isLoading$,
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }

                              if (snapshot.data == ButtonState.loading) {
                                return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive());
                              }
                              return Wrap(
                                spacing: 20,
                                children: [
                                  ActionButtons(
                                      text: 'Pay Now',
                                      isEnable: true,
                                      callback: () async {
                                        if (canSave() && hasSignature) {
                                          stopWorkBloc.isLoading$
                                              .add(ButtonState.loading);
                                          await stopWorkDto();
                                          stopWorkBloc.isLoading$
                                              .add(ButtonState.loaded);
                                          Navigator.pushNamed(
                                              context, 'credit_card');
                                        } else {
                                          showToast('No signature or too small.');
                                        }
                                      }),
                                  ActionButtons(
                                      text: 'Add to Account',
                                      isEnable: true,
                                      callback: () async {
                                        if (stopWorkBloc
                                                .currentCustomerSignature
                                                .value
                                                .length <
                                            6200) {
                                          showToast(
                                              'No signature or too small.');
                                          return;
                                        }
                                        if (canSave() && hasSignature) {
                                          if (await showConfirmDialog(context,
                                              'Are you sure you want to charge this account?')) {
                                            stopWorkBloc.isLoading$
                                                .add(ButtonState.loading);
                                            await stopWorkDto();
                                            final swDto =
                                                stopWorkBloc.stopWorkDto;
                                            final nrcId = await creditCardBloc
                                                .postCreditCardMakeNRC(
                                                    swDto, context);
                                            if (nrcId.isEmpty) {
                                              showToast('Error on Make NRC');
                                              return;
                                            }
                                            await stopWorkBloc.chargeAccount(
                                                swDto, nrcId, context);
                                            if(stopWorkBloc.isClose.value) stopWorkBloc.closeTicket();
                                          }
                                        }
                                      }),
                                ],
                              );
                            })
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
