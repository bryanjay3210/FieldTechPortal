import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';
import 'package:intl/intl.dart';

import '../../../models/event/event_dto.dart';
import '../../../utils/utils/location/location.dart';

class StartWorkRepo extends RequestApi {
  StartWorkRepo(super.server);

  dynamic postStartWork(EventDto data, BuildContext context) async {
    final date = data.date;
    final location = await physicalLocation();
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": "StartWork",
      "TechID": data.techId,
      "Date": "${date!.month}/${date.day}/${date.year}",
      "Time": DateFormat('H:mm').format(date),
      "EventID": "${data.eventId}",
      "GPS": "${location.latitude}, ${location.longitude}",
      "TimeChgReason": "${data.changedReason}"
    };
    return await getApi(dataUrl, context: context);
  }
}
