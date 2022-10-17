import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:ft/constants/state_const.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details_repo.dart';
import 'package:ft/modules/schedule/schedule.dart';
import 'package:rxdart/subjects.dart';

import '../../../constants/signature_const.dart';
import '../../../core/main/main.dart';
import '../../../models/event/stop_work_dto.dart';
import '../../../models/trip_rate/trip_rate.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import 'stop_work_repo.dart';

class StopWorkBloc {
  final _stopWorkRepo = (int server) =>
      locator.get<StopWorkRepo>(param1: server as int, param2: '');
  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final mainBloc = locator.get<MainBloc>();
  final isClose = BehaviorSubject<bool>.seeded(false);

  final currentCustomerSignature =
      BehaviorSubject<Uint8List>.seeded(clearSignature);
  var timeStopped;
  var isLoading$ = BehaviorSubject<ButtonState>.seeded(ButtonState.loaded);
  var tripRate = TripRate();
  var stopWorkDto = StopWorkDto(0);

  timeStop() {
    timeStopped ??= DateTime.now();
  }

  Future<TripRate> getTechnicianTripRate(
      Map<String, dynamic> map, BuildContext context) async {
    Map<String, dynamic> data =
        await _stopWorkRepo(map['server']).getTechnicianTripRate(map, context);
    if (data['Status'] == "Success") {
      final trip = TripRate.fromJson(data);
      tripRate = trip;
      return trip;
    } else {
      return TripRate();
    }
  }

  Future<String> postNrcInvoice(Map<String, dynamic> map) async {
    Map<String, dynamic> data =
        await StopWorkRepo(map['server']).postNrcInvoice(map);
    if (data['Status'] == "Success") {
      return 'Success';
    }
    return '';
  }

  Future<String> postStopWork(StopWorkDto dto, BuildContext context) async {
    Map<String, dynamic> data =
        await _stopWorkRepo(dto.server).postStopWork(dto, context);
    if (data['Status'] == "Success") {
      locator.get<ScheduleBloc>().getDailySchedule(
          {'server': dto.server, 'date': DateTime.now(), 'techId': dto.techId},
          context: context);
      Navigator.popUntil(context, (route) => route.settings.name == "schedule");
      return data['Status'];
    } else {
      return 'error';
    }
  }

  chargeAccount(StopWorkDto dto, String nrcId, BuildContext context) async {
    isLoading$.add(ButtonState.loading);
    final invoice = await postNrcInvoice({
      'customerId': serviceCallDetailsBloc.currentCustomerEvent.CustomerID,
      'server': mainBloc.server,
      'email': mainBloc.login.UserEmail,
      'nrc': nrcId
    });
    if (invoice == 'Success') {
      final result = await postStopWork(dto, context);
      if (result == 'Success') {
        isLoading$.add(ButtonState.loaded);
        showToast('Transaction successful');
      } else {
        showToast('Transaction not successful');
        isLoading$.add(ButtonState.loaded);
      }
    } else {
      isLoading$.add(ButtonState.loaded);
      showToast('Charge Invoice Failed');
    }
  }

  clearCurrentSignature() {
    currentCustomerSignature.add(clearSignature);
  }

  closeTicket() async{
    Map<String, dynamic> serviceCall = await ServiceCallDetailsRepo(mainBloc.server).getServiceCall({
      'ticketId': serviceCallDetailsBloc.selectedEvent.TicketID,
    });
    Map<String, dynamic> data =
        await _stopWorkRepo(mainBloc.server).closeTicket({
          'ticketID': serviceCallDetailsBloc.selectedEvent.TicketID,
          'userID' : serviceCall['UserID'].toString(),
          'assignedTo': serviceCall['TicketAssignedTo'].toString(),
          'priority': serviceCall['TicketPriority'].toString(),
          'category': serviceCall['TicketCategory'].toString(),
        });
    if (data['Status'] == "Success") {
      showToast(data['Status']);
    } else {
      showToast(data['Status']);
    }
  }

  cancelEvent(Map<String, dynamic> map, BuildContext context) async {
    Map<String, dynamic> data =  await StopWorkRepo(map['server']).cancelEvent(map, context);
    return data;
  }

  addResolution(Map<String, dynamic> map, BuildContext context) async {
    Map<String, dynamic> data =  await StopWorkRepo(map['server']).addResolution(map, context);
    return data;
  }
}
