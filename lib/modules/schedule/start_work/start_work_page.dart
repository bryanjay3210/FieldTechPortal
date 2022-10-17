import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/shared_widgets/toasts.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import '../../../constants/state_const.dart';
import '../../../models/event/event_dto.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/shared_app_bar.dart';
import '../../../utils/utils/datetime/date_convert.dart';
import '../../../utils/utils/theme/global_colors.dart';
import '../shared_widget/actions_button.dart';
import '../schedule_page.dart';
import 'start_work.dart';

class StartWorkPage extends StatefulWidget {
  const StartWorkPage({Key? key}) : super(key: key);

  @override
  State<StartWorkPage> createState() => _StartWorkPageState();
}

class _StartWorkPageState extends State<StartWorkPage> {
  final startWorkBloc = locator.get<StartWorkBloc>();
  final onChange$ = BehaviorSubject<String>();
  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final mainBloc = locator.get<MainBloc>();
  String date = "";
  final reasonController = TextEditingController();

  @override
  void initState() {
    startWorkBloc.timeStarted = DateTime.now();
    super.initState();
  }

  bool isOnTime() {
    final currentTime =
        dateToTimeStringhm(startWorkBloc.timeStarted).split(':');
    final startTime =
        jsTimeToTimehm(serviceCallDetailsBloc.selectedEvent.EventStart)
            .split(':');
    final ans = (int.parse(currentTime[0] + currentTime[1]) -
        int.parse(startTime[0] + currentTime[1]));
    if (ans >= -5 && ans <= 5) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final customerEvent = serviceCallDetailsBloc.currentCustomerEvent;
    final customer = serviceCallDetailsBloc.currentCustomer;
    final selectedEvent = serviceCallDetailsBloc.selectedEvent;
    String assetLocation = 'lib/assets/images/schedule/';
    date = dateToTimeStringhhmmaa(startWorkBloc.timeStarted);
    final isDarkTheme = mainBloc.isDarkTheme$.value;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: appBarShared('Start Work', null),
          body: StreamBuilder<ButtonState>(
              stream: startWorkBloc.isLoading$,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const SizedBox();
                }

                if (snapshot.data == ButtonState.loading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
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
                                      flex: 0, child: Icon(Icons.account_circle)),
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
                                          customerEvent.EventLoc.toString().replaceAll('+', ' ').replaceAll('%0A', '\n').replaceAll('%2C', ','),
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
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 0,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat('MMM dd, yyyy').format(
                                          jsTimeToDateTime(
                                              customerEvent.EventStartTime)),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            isDarkTheme ? ftWhite : ftTextBlack,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            '${assetLocation}schedule_menu.svg'),
                                        const SizedBox(width: 3),
                                        time(assetLocation,
                                            customerEvent.EventStartTime),
                                        const Text('  -  ',
                                            style: TextStyle(
                                                color: Color(0xFFE5A900))),
                                        time(assetLocation,
                                            customerEvent.EventEndTime),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time Started',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: isDarkTheme ? ftWhite : ftIconGrey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(date),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      if (!isOnTime())
                        const SizedBox(
                          height: 40,
                        ),
                      if (!isOnTime())
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Change Time Reason',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: ftTextBlack)),
                            TextFormField(
                                controller: reasonController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Change Time Reason',
                                ),
                                autovalidateMode: AutovalidateMode.always,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Reason for changing expected time';
                                  }
                                },
                                onChanged: (str) {
                                  onChange$.add(str);
                                }),
                          ],
                        ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: StreamBuilder<String>(
                            stream: onChange$,
                            builder: (context, snapshot) {
                              final disabled =
                                  !isOnTime() && reasonController.text.isEmpty;
                              return ActionButtons(
                                callback: () {
                                  if (disabled) {
                                    showToast('Enter Change Time Reason First');
                                  } else {
                                    EasyDebounce.debounce('start-work-debounce', const Duration(seconds: 2), () {
                                      final dto = EventDto(
                                        mainBloc.server,
                                        changedReason: reasonController.text,
                                        date: startWorkBloc.timeStarted,
                                        eventId: customerEvent.EventID,
                                        techId: mainBloc.login.UserID,
                                      );
                                      startWorkBloc.startWork(dto, context);
                                    });
                                  }
                                },
                                isEnable: !disabled,
                                text: 'Start Work',
                              );
                            }),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
