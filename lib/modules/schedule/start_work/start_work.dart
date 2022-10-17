import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/modules/schedule/stop_work/stop_work.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/state_const.dart';
import '../../../models/event/event_dto.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import 'start_work_repo.dart';

class StartWorkBloc {
  final _startWorkRepo = (int server) =>
      locator.get<StartWorkRepo>(param1: server as int, param2: '');
  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final _stopWorkBloc = locator.get<StopWorkBloc>();

  final isLoading$ = BehaviorSubject<ButtonState>.seeded(ButtonState.loaded);

  var timeStarted = DateTime.now();
  var timeStopped = DateTime.now();
  var timeCount = const Duration(seconds: 0);
  var pausedTime = const Duration(seconds: 0);
  Timer? _timer;
  var isPaused = false;
  var hasStarted = false;

  startWork(EventDto dto, BuildContext context) async {
    Map<String, dynamic> data =
        await _startWorkRepo(dto.server).postStartWork(dto, context);
    isLoading$.add(ButtonState.loading);
    serviceCallDetailsBloc.callServiceStatus$.add(5);
    if (data['Status'] == "Success") {
      hasStarted = true;
      timeStarted = timeStarted;
      serviceCallDetailsBloc.callServiceStatus$.add(3);
      isLoading$.add(ButtonState.loaded);
      Navigator.pop(context);
      startTimer();
      showToast("It's work time!");
    } else {
      hasStarted = false;
      serviceCallDetailsBloc.callServiceStatus$.add(2);
      isLoading$.add(ButtonState.loaded);
    }
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 4), (Timer timer) {
      if (isPaused) {
        pausedTime = pausedTime + const Duration(seconds: 1);
        return;
      }
      timeCount = timeCount + const Duration(seconds: 1);
    });
  }

  stopWork(BuildContext context) {
    _timer?.cancel();
    serviceCallDetailsBloc.callServiceStatus$.add(4);
    _stopWorkBloc.timeStop();
    showToast('Work Stopped');
    Navigator.pushNamed(context, 'stop_work');
  }

  togglePause() async{
    isPaused = !isPaused;
    await setToggle(isPaused);
  }
  Future<void> setToggle(bool value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('toggle', value);
  }
}
