import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';

class ScheduleRepo extends RequestApi {
  ScheduleRepo(super.server);

  dynamic getDailySchedule(Map<String, dynamic> map,
      {BuildContext? context}) async {
    final date = map['date'] as DateTime;
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": "DailySchedule",
      "TechID": map['techId'],
      "Date": "${date.month}/${date.day}/${date.year}",
      "ShowClosed": "N",
      "ShowCancelled":"N",
    };
    return await getApi(dataUrl, context: context);
  }
}
