import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

import '../../constants/state_const.dart';
import '../../core/main/main.dart';
import '../../models/event/event.dart';
import '../../services/locator.dart';
import 'schedule_repo.dart';

class ScheduleBloc {
  //states
  final eventListState$ = BehaviorSubject<DataState>.seeded(DataState.initial);

  var eventList = <Event>[];
  final scheduleRepo = (int server) =>
      locator.get<ScheduleRepo>(param1: server as int, param2: '');
  final mainBloc = locator.get<MainBloc>();
  var currentDate$ = BehaviorSubject.seeded(DateTime.now());

  changeDate(DateTime newDate) {
    currentDate$.add(newDate);
    getDailySchedule({'server': mainBloc.server, 'date': newDate});
  }

  getDailySchedule(Map<String, dynamic> map, {BuildContext? context}) async {
    final server = map['server'] as int;
    map['techId'] = mainBloc.login.UserID;
    eventListState$.add(DataState.loading);
    Map<String, dynamic> data =
        await scheduleRepo(server).getDailySchedule(map, context: context);

    if (data['Status'] == 'Success') {
      final list = <Event>[];
      if (data['Event'] == null) {
        eventList.clear();
        eventListState$.add(DataState.empty);
        return;
      } else if (data['Event'] is Map) {
        list.add(Event.fromJson(data['Event']));
      } else {
        data['Event'].forEach((element) {
          list.add(Event.fromJson(element));
        });
      }

      eventList = list;
      eventList.sort((a, b) => a.EventStart.compareTo(b.EventStart),);
      eventListState$.add(DataState.success);
    } else {
      eventList.clear();
      eventListState$.add(DataState.error);
    }
  }
}
