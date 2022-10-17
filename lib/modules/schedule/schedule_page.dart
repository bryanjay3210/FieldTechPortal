import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ft/models/event/comment.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:intl/intl.dart';
import '../../constants/state_const.dart';
import '../../core/main/main.dart';
import '../../models/event/event.dart';
import '../../services/locator.dart';
import '../../shared_widgets/shared_app_bar.dart';
import '../../utils/utils/datetime/date_convert.dart';
import '../../utils/utils/theme/global_colors.dart';
import 'schedule.dart';
import 'start_work/start_work.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String ticketno = '';
  String installerName = '';
  String directory = 'lib/assets/images/schedule/';
  final scheduleBloc = locator.get<ScheduleBloc>();
  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final mainBloc = locator.get<MainBloc>();
  final startWorkBloc = locator.get<StartWorkBloc>();
  var commentList = <Comment>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      reload(DateTime.now());
    });
  }

  reload(DateTime date) {
    scheduleBloc.changeDate(date);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDarkTheme = mainBloc.isDarkTheme$.value;
    DateTime? selectedDate;
    return Scaffold(
      appBar: appBarShared('My Schedule', () {
        reload(selectedDate!);
      }),
      body: Stack(
        children: [
          StreamBuilder<DataState>(
              stream: scheduleBloc.eventListState$,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const SizedBox();
                }
                if (snapshot.data == DataState.initial ||
                    snapshot.data == DataState.loading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (snapshot.data == DataState.empty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: Image.asset(
                            'lib/assets/images/schedule/no_ticket.png'),
                      ),
                      const SizedBox(height: 20),
                      const Text('No Ticket/s Found')
                    ],
                  );
                }
                if (snapshot.data == DataState.error) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        reload(selectedDate!);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.refresh),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Click here to reload'),
                        ],
                      ),
                    ),
                  );
                }

                return ListView(
                    padding: const EdgeInsets.only(top: 50, bottom: 10),
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(children: [
                            ...scheduleBloc.eventList
                                .map((e) => myScheduleCard(e))
                                .toList()
                          ]))
                    ]);
              }),
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: StreamBuilder<DateTime>(
                stream: scheduleBloc.currentDate$,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const SizedBox();
                  }
                  selectedDate = snapshot.data!;
                  return ElevatedButton(
                      onPressed: () async {
                        final selected = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (selected != null && selected != DateTime.now()) {
                          scheduleBloc.changeDate(selected);
                        }
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              splashRadius: 25,
                              icon: Icon(Icons.arrow_back_ios_rounded,
                                  size: 12,
                                  color: isDarkTheme ? ftWhite : ftIconGrey),
                              onPressed: () {
                                scheduleBloc.changeDate(snapshot.data!
                                    .subtract(const Duration(days: 1)));
                              },
                            ),
                            Text(
                                DateFormat('MMM dd, yyyy')
                                    .format(snapshot.data!),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: isDarkTheme ? ftWhite : ftIconGrey)),
                            IconButton(
                              splashRadius: 25,
                              icon: Icon(Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                  color: isDarkTheme ? ftWhite : ftIconGrey),
                              onPressed: () {
                                scheduleBloc.changeDate(snapshot.data!
                                    .add(const Duration(days: 1)));
                              },
                            )
                          ]),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(45)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(horizontal: 10)),
                          elevation: MaterialStateProperty.all<double>(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ))));
                }),
          )
        ],
      ),
    );
  }

  Color containerColor(Event event) {
    var timeStart = jsTimeToTimehhmmaa(event.EventStart);
    Color resultColor = ftWhite;
    if (timeStart == '09:00 AM') {
      resultColor = const Color(0xffFDF7B8);
    }
    if (timeStart == '11:00 AM') {
      resultColor = const Color(0xffFF9872);
    }
    if (timeStart == '01:00 PM') {
      resultColor = const Color(0xffD1E6F2);
    }
    if (timeStart == '03:00 PM') {
      resultColor = const Color(0xffBCEE68);
    }
    return resultColor;
  }

  Widget myScheduleCard(Event event) => GestureDetector(
        onTap: () {
          locator.get<ServiceCallDetailsBloc>().selectedEvent = event;
          serviceCallDetailsBloc.callServiceStatus$.add(0);
          serviceCallDetailsBloc.canBePopped = true;
          startWorkBloc.hasStarted = false;
          Navigator.pushNamed(context, 'service_call_details', arguments: {'commentText': commentList.last.CommentText}).then((_) => reload(DateTime.now()));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            color: containerColor(event),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xFFFFC82E), Color(0xFFFFAC20)],
                        ),
                      ),
                      child: Text(
                        event.TicketID,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: ftTextBlack),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('${directory}card_header_bg.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          event.Name,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: ftTextBlack),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5D8),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    '${directory}schedule_menu.svg'),
                                const SizedBox(width: 3),
                                time(directory, event.EventStart),
                                const Text('  -  ',
                                    style: TextStyle(color: Color(0xFFE5A900))),
                                time(directory, event.EventEnd),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(padding: const EdgeInsets.all(10), width: double.infinity, child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Ticket Comments', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
                          StatefulBuilder(builder: (context, setState) {
                            commentList = <Comment>[];
                            if(event.Comment is Map){
                              commentList.add(Comment.fromJson(event.Comment));
                            } else if(event.Comment is List<dynamic>) {
                              var data = event.Comment as List<dynamic>;
                              for(var ds in data){
                                commentList.add(Comment.fromJson(ds));
                              }
                            }
                            if(commentList.isNotEmpty){
                              return SingleChildScrollView(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: ListView.builder(
                                    itemCount: commentList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          index == 0 ? const SizedBox() : const Divider(indent: 10, endIndent: 10, thickness: 2),
                                          ListTile(
                                            leading: const Icon(Icons.account_circle, color: Colors.black),
                                            title: Text(commentList[index].CommentText, style: const TextStyle(fontSize: 13, color: Colors.black)),
                                            trailing: Text(jsTimeToDateTimeString(commentList[index].CommentDate), style: const TextStyle(fontSize: 13, color: Colors.black)),
                                          ),
                                        ],
                                      );
                                  },),
                                ),
                              );
                            }
                            return const SizedBox();
                          },),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

Widget time(String directory, dynamic time) {
  return Text(
    jsTimeToTimehhmmaa(time),
    style: const TextStyle(color: Color(0xFFE5A900)),
  );
}
