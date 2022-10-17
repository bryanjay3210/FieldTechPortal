import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/core/login/login.dart';
import 'package:ft/core/main/main.dart';
import 'package:ft/models/event/stop_work_dto.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/shared_widgets/shared_dialog.dart';
import 'package:ft/utils/utils/datetime/date_convert.dart';
import 'package:ft/utils/utils/theme/global_colors.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/customer_event/customer_event.dart';
import '../../../models/event/travel_dto.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/shared_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared_widgets/toasts.dart';
import '../../../utils/utils/location/location.dart';
import '../schedule_page.dart';
import '../start_work/start_work.dart';
import '../stop_work/stop_work.dart';
import '../shared_widget/actions_button.dart';
import 'service_call_details.dart';

class ServiceCallDetailsPage extends StatefulWidget {
  const ServiceCallDetailsPage({Key? key}) : super(key: key);

  @override
  State<ServiceCallDetailsPage> createState() => _ServiceCallDetailsPageState();
}

class _ServiceCallDetailsPageState extends State<ServiceCallDetailsPage> {
  final togglePause$ = BehaviorSubject<bool>.seeded(false);

  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final mainBloc = locator.get<MainBloc>();
  final loginBloc = locator.get<LoginBloc>();
  final startWorkBloc = locator.get<StartWorkBloc>();
  final stopWorkBloc = locator.get<StopWorkBloc>();
  String technician = '';
  TextEditingController ctrlComment = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var now = DateTime.now();
      await serviceCallDetailsBloc.getTechnician({
        'date': '${now.month}/${now.day}/${now.year}',
        'regionId': loginBloc.techInfo.RegionID,
        'userId': mainBloc.login.UserID,
        'server': mainBloc.server,
      }, context);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    ctrlComment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvent = serviceCallDetailsBloc.selectedEvent;
    final isDarkTheme = mainBloc.isDarkTheme$.value;

    final Size size = MediaQuery.of(context).size;
    String assetLocation = 'lib/assets/images/schedule/';

    Future.delayed(const Duration(seconds: 0), () async{
      Map<String,dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      if(!args['commentText'].toString().contains('Time Change Reason')){
        serviceCallDetailsBloc
            .callServiceStatus$
            .add(1);
      } else {
        togglePause$.add(await getToggle());
      }
    });
    return Scaffold(
        appBar: appBarShared('Service Call Details', null),
        body: WillPopScope(
          onWillPop: () {
            final val = serviceCallDetailsBloc.canBePopped;
            if (!val) {
              showToast('Service already started');
            }
            return Future.value(val);
          },
          child: FutureBuilder<CustomerEvent>(
              future: serviceCallDetailsBloc.getEvent({
                // 'ticketId': selectedEvent.TicketID,
                'eventId': selectedEvent.EventID,
                'techId': mainBloc.login.UserID,
                'server': mainBloc.server
              }, context: context),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if(serviceCallDetailsBloc.currentCustomerEvent.EventStatus == 'Stop Travel' || serviceCallDetailsBloc.currentCustomerEvent.EventStatus == 'Inproc'){
                  startWorkBloc.hasStarted = true;
                }
                final customer = serviceCallDetailsBloc.currentCustomer;
                final customerEvent = snapshot.data;
                return StreamBuilder<bool>(
                    stream: serviceCallDetailsBloc.isLoading$,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const SizedBox();
                      }

                      if (snapshot.data == null) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                height: 40.0,
                                width: double.infinity,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Center(
                                        child: Text(selectedEvent.TicketID,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
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
                                                  color: isDarkTheme ? Colors.white : ftIconGrey,
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                customerEvent!.EventLoc.toString().replaceAll('+', ' ').replaceAll('%0A', '\n').replaceAll('%2C', ','),
                                                style: TextStyle(
                                                  color: isDarkTheme ? Colors.white : ftTextColorBody,
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
                                                  color: isDarkTheme ? Colors.white : ftIconGrey,
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                customer.BuildingName,
                                                style: TextStyle(
                                                  color: isDarkTheme ? Colors.white : ftTextColorBody,
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
                                                color: isDarkTheme ? Colors.white : ftIconGrey,
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
                                                style: TextStyle(
                                                  color: isDarkTheme ? Colors.white : ftTextColorBody,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        const Divider(thickness: 1),
                                        const SizedBox(height: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.description_outlined, color: isDarkTheme ? Colors.white : ftIconGrey,),
                                                const SizedBox(width: 10,),
                                                const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            SizedBox(width: double.infinity, child: Text(customerEvent.EventDesc, style: TextStyle(fontSize: 13, color: isDarkTheme ? Colors.white : ftTextColorBody,),)),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Icon(Icons.note_alt_outlined, color: isDarkTheme ? Colors.white : ftIconGrey,),
                                                const SizedBox(width: 10,),
                                                const Text('Note', style: TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            SizedBox(width: double.infinity, child: Text(customerEvent.EventNote.toString().replaceAll('+', ' ')
                                                .replaceAll('%3A', ':').replaceAll('%0A', '\n').replaceAll('%23', '#'), style: TextStyle(fontSize: 13, color: isDarkTheme ? Colors.white : ftTextColorBody,),)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      flex: 0,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              DateFormat('MMM dd, yyyy').format(
                                                  jsTimeToDateTime(
                                                      customerEvent
                                                          .EventStartTime)),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
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
                                                time(
                                                    assetLocation,
                                                    customerEvent
                                                        .EventStartTime),
                                                const Text('  -  ',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFE5A900))),
                                                time(assetLocation,
                                                    customerEvent.EventEndTime),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: StreamBuilder<int>(
                                          stream: serviceCallDetailsBloc
                                              .callServiceStatus$,
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return const SizedBox();
                                            }

                                            if (snapshot.data! < 1) {
                                              return const SizedBox();
                                            }

                                            return ButtonTheme(
                                              child: ElevatedButton(
                                                style: TextButton.styleFrom(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  final position =
                                                      await physicalLocation();
                                                  final d = DateTime.now();
                                                  final dto = StopWorkDto(
                                                    mainBloc.server,
                                                    eventId:
                                                        selectedEvent.EventID,
                                                    customerId: customerEvent
                                                        .CustomerID,
                                                    techId: mainBloc
                                                        .login.CustomerID,
                                                    date:
                                                        "${d.month}/${d.day}/${d.year}",
                                                    time:
                                                        '${d.hour}:${d.minute}',
                                                    gps: position,
                                                    workPerformed:
                                                        'cancelled/aborted',
                                                    overageReason: '',
                                                    timeSpent:
                                                        durationToTimeStringhm(
                                                            startWorkBloc
                                                                .timeCount),
                                                    charges: [
                                                      '0',
                                                      '0',
                                                      '0',
                                                      '0',
                                                    ],
                                                    ticketId:
                                                        selectedEvent.TicketID,
                                                  );

                                                  if (await showConfirmDialog(
                                                      context,
                                                      'Are you sure you want to end this service call permanently?')) {

                                                    showDialog(context: context, builder: (context) {
                                                      return AlertDialog(title: const Text('Enter resolution'),
                                                        content: TextField(controller: ctrlComment,),
                                                        actions: [
                                                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                                          TextButton(onPressed: () async{
                                                            if(ctrlComment.text.isEmpty){
                                                              showToast('Resolution is empty!');
                                                            }
                                                            serviceCallDetailsBloc
                                                                .isLoading$
                                                                .add(true);

                                                            // final res =
                                                            //     await stopWorkBloc
                                                            //     .postStopWork(
                                                            //     dto, context);

                                                            var ticketData = await serviceCallDetailsBloc.getServiceCall(
                                                                {
                                                                  'ticketId': serviceCallDetailsBloc.selectedEvent.TicketID,
                                                                  'server': mainBloc.server
                                                                }, context);
                                                            await stopWorkBloc.addResolution({
                                                              'ticketID': serviceCallDetailsBloc.selectedEvent.TicketID,
                                                              'addComment': ctrlComment.text,
                                                              'resolution': ctrlComment.text,
                                                              'assignedTo': ticketData['TicketAssignedTo'],
                                                              'emailedTo': ticketData['EmailedTo'],
                                                              'priority': ticketData['TicketPriority'],
                                                              'ticketSummary': ticketData['TicketSummary'],
                                                              'userId' : mainBloc.login.UserID,
                                                              'server' : mainBloc.server,
                                                            }, context);

                                                            final res = await stopWorkBloc.cancelEvent(
                                                                {
                                                                  'eventID': serviceCallDetailsBloc.currentCustomerEvent.EventID,
                                                                  'eventType': serviceCallDetailsBloc.currentCustomerEvent.EventType,
                                                                  'eventStatus': serviceCallDetailsBloc.currentCustomerEvent.EventStatus,
                                                                  'eventPriority' : serviceCallDetailsBloc.currentCustomerEvent.EventPriority,
                                                                  'startDate' : DateFormat('MM/dd/yyyy').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventStartTime)),
                                                                  'startHour' : DateFormat('hh').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventStartTime)),
                                                                  'startMinute' : DateFormat('mm').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventStartTime)),
                                                                  'startAMPM' : DateFormat('a').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventStartTime)),
                                                                  'endDate' : DateFormat('MM/dd/yyyy').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventEndTime)),
                                                                  'endHour' : DateFormat('hh').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventEndTime)),
                                                                  'endMinute' : DateFormat('mm').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventEndTime)),
                                                                  'endAMPM' : DateFormat('a').format(jsTimeToDateTime(serviceCallDetailsBloc.currentCustomerEvent.EventEndTime)),
                                                                  'linkedTicket' : serviceCallDetailsBloc.selectedEvent.TicketID,
                                                                  'userId' : mainBloc.login.UserID,
                                                                  'server' : mainBloc.server,
                                                                }, context);

                                                            if (res['Status'] == 'Success') {
                                                              showToast(
                                                                  'Service Cancelled');
                                                              serviceCallDetailsBloc
                                                                  .isLoading$
                                                                  .add(false);
                                                              Navigator
                                                                  .pushReplacementNamed(
                                                                  context,
                                                                  'schedule');
                                                            } else {
                                                              showToast(
                                                                  'Failed to cancel');
                                                              serviceCallDetailsBloc
                                                                  .isLoading$
                                                                  .add(false);
                                                            }
                                                          }, child: const Text('Confirm')),
                                                        ],
                                                      );
                                                    },);
                                                  }
                                                },
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ftDashboardMenuBtnColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.cancel_rounded,
                                                          color: Colors.red,
                                                          size: 25,
                                                        ),
                                                        SizedBox(width: 12),
                                                        Text(
                                                          'Cancel Service',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: ftTextBlack,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  flex: 0,
                                  child: ButtonTheme(
                                    child: ElevatedButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(0.0),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (customer.PhoneCell is Map ||
                                            customer.PhoneWork is Map) {
                                          showToast('No cellphone number');
                                          return;
                                        }
                                        launchUrl(Uri(
                                            scheme: "tel",
                                            path: customer.PhoneWork ??
                                                customer.PhoneHome ??
                                                customer.PhoneWork));
                                      },
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Press to call',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w800,
                                                    color: mainBloc
                                                            .isDarkTheme$.value
                                                        ? ftWhite
                                                        : ftTextBlack),
                                              ),
                                              const SizedBox(height: 12),
                                              SvgPicture.asset(
                                                  '${assetLocation}call_icon_ticket.svg',
                                                  height: 25),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            StreamBuilder<DataState>(
                              stream: serviceCallDetailsBloc.availableTechnicianStatus$,
                              builder: (context, snapshot) {
                              if(snapshot.data == DataState.loading){
                                return const Center(child: CircularProgressIndicator.adaptive(),);
                              }
                              return Visibility(
                                visible: !startWorkBloc.hasStarted,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isDarkTheme ? ftBlackContainer : ftContainerGreyLight,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Reassign Ticket', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 20,),
                                      DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                          showSelectedItems: true,
                                        ),
                                        items: serviceCallDetailsBloc.availableTechnician,
                                        onChanged: (value) {
                                          technician = value.toString();
                                          print(value);
                                          },
                                      ),
                                      const SizedBox(height: 10,),
                                      Container(decoration: BoxDecoration(color: ftPrimaryColor, borderRadius: BorderRadius.circular(10)), width: double.infinity, height: 40, child: TextButton(onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: const Text('Reassign Ticket'),
                                          content: Text('Are you sure you want to reassign this ticket to $technician'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                var techID = serviceCallDetailsBloc.availableTechnicianList.toList().firstWhere((element) => element.TechName == technician).TechID;
                                                serviceCallDetailsBloc.reAssignTicket({
                                                'eventDate': DateFormat('MM-dd-yyyy').format(jsTimeToDateTime(customerEvent.EventStartTime)),
                                                'eventID': customerEvent.EventID,
                                                'techID': techID,
                                                'eventStart': DateFormat('hh:mm').format(jsTimeToDateTime(customerEvent.EventStartTime)),
                                                'eventEnd': DateFormat('HH:mm').format(jsTimeToDateTime(customerEvent.EventEndTime)),
                                                'userId': mainBloc.login.UserID,
                                                'server': mainBloc.server
                                                }, context);
                                              },
                                              child: const Text('Yes'),
                                            ),
                                          ],
                                        ),
                                      ), child: const Text('Reassign', style: TextStyle(color: Colors.black),)))
                                    ],
                                  ),
                                ),
                              );
                            },),
                            const SizedBox(height: 20,),
                            StreamBuilder<int>(
                                stream:
                                    serviceCallDetailsBloc.callServiceStatus$,
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const SizedBox();
                                  }

                                  if (snapshot.data == 5) {
                                    return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive());
                                  }
                                  final data = snapshot.data;
                                  return Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    children: [
                                      ActionButtons(
                                          text: 'Start Travel',
                                          isEnable: data == 0,
                                          callback: data == 0
                                              ? () async {
                                                  final res =
                                                      await showConfirmDialog(
                                                          context,
                                                          'Are you sure you want to start travel?');
                                                  if (res) {
                                                    serviceCallDetailsBloc
                                                        .callServiceStatus$
                                                        .add(5);
                                                    final location =
                                                        await physicalLocation();
                                                    final dto = TravelDto(
                                                        mainBloc.server,
                                                        travelType:
                                                            'StartTravel',
                                                        techId: mainBloc
                                                            .login.UserID,
                                                        ticketId: selectedEvent
                                                            .TicketID,
                                                        eventId: selectedEvent
                                                            .EventID,
                                                        position: location);

                                                    await serviceCallDetailsBloc
                                                        .postTravel(
                                                            dto, context);
                                                    showToast('Started Travel');
                                                  }
                                                }
                                              : () {}),
                                      ActionButtons(
                                          text: 'Stop Travel',
                                          isEnable: data == 1,
                                          callback: data == 1
                                              ? () async {
                                                  final res =
                                                      await showConfirmDialog(
                                                          context,
                                                          'Are you sure you want to start travel?');
                                                  if (res) {
                                                    serviceCallDetailsBloc
                                                        .callServiceStatus$
                                                        .add(5);
                                                    final location =
                                                        await physicalLocation();
                                                    final dto = TravelDto(
                                                        mainBloc.server,
                                                        travelType:
                                                            'StopTravel',
                                                        techId: mainBloc
                                                            .login.UserID,
                                                        ticketId: selectedEvent
                                                            .TicketID,
                                                        eventId: selectedEvent
                                                            .EventID,
                                                        position: location);

                                                    await serviceCallDetailsBloc
                                                        .postTravel(
                                                            dto, context);
                                                    showToast('Stopped Travel');
                                                  }
                                                }
                                              : () {}),
                                      StreamBuilder<bool>(
                                          stream: togglePause$,
                                          builder: (context, snapshot) {
                                            var toggle = false;
                                            if (snapshot.data == null) {
                                              toggle = false;
                                            } else {
                                              toggle = snapshot.data!;
                                            }
                                            return Wrap(
                                              spacing: 20,
                                              runSpacing: 20,
                                              children: [
                                                ActionButtons(
                                                    text: !startWorkBloc.hasStarted
                                                        ? 'Start Work'
                                                        : toggle
                                                            ? 'Paused'
                                                            : 'Working',
                                                    isEnable:
                                                        data == 2 || data == 3,
                                                    callback: data == 2 || data == 3
                                                        ? () async {
                                                            if (startWorkBloc
                                                                .hasStarted) {
                                                              togglePause$
                                                                  .add(!toggle);
                                                              startWorkBloc
                                                                  .togglePause();
                                                              return;
                                                            } else {
                                                              startWorkBloc.hasStarted = true;
                                                            }
                                                            Navigator.pushNamed(
                                                                context,
                                                                'start_work');
                                                          }
                                                        : () {}),
                                                ActionButtons(
                                                    text: 'Stop Work',
                                                    isEnable: (data == 3 || data == 4) && !toggle,
                                                    callback: (data == 3 || data == 4)  && !toggle
                                                        ? () async {
                                                      final res =
                                                      await showConfirmDialog(
                                                          context,
                                                          'Are you sure you want to stop timer?');
                                                      if (res) {
                                                        startWorkBloc
                                                            .stopWork(context);
                                                      }
                                                    }
                                                        : () {}),
                                              ],
                                            );
                                          }),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      );
                    });
              }),
        ));
  }
  Future<bool> getToggle() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? toggle = prefs.getBool('toggle');
    return toggle ?? false;
  }
}
