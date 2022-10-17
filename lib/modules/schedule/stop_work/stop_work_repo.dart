import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';

import '../../../models/event/stop_work_dto.dart';

class StopWorkRepo extends RequestApi {
  StopWorkRepo(super.server);

  dynamic getTechnicianTripRate(
      Map<String, dynamic> map, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": "TripRate",
      "TechID": map['techId'],
      "StartTravelLocation": [map['startLat'], map['startLong']],
      "StopTravelLocation": [map['stopLat'], map['stopLong']]
    };

    return await getApi(dataUrl, context: context);
  }

  dynamic cancelEvent(
      Map<String, dynamic> map, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Events",
      "Subcommand1": "Update",
      "Subcommand2": "General",
      "EventID": map['eventID'],
      "EventType": map['eventType'],
      "EventStatus": 'Cancelled',
      "EventPriority": map['eventPriority'],
      "StartDate": map['startDate'],
      "StartHour": map['startHour'],
      "StartMinute": map['startMinute'],
      "StartAMPM": map['startAMPM'],
      "EndDate": map['endDate'],
      "EndHour": map['endHour'],
      "EndMinute": map['endMinute'],
      "EndAMPM": map['endAMPM'],
      "LinkedTicket": map['linkedTicket'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic addResolution(
      Map<String, dynamic> map, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Ticket",
      "Subcommand1": "Update",
      "TicketID": map['ticketID'],
      "UserID": map['userId'],
      "AddComment": map['addComment'],
      "Resolution": map['resolution'],
      "NewStatus": 'CLOSED',
      "AssignedTo": map['assignedTo'],
      "EmailedTo": map['emailedTo'],
      "Priority": map['priority'],
      "Category": 'Cancellation',
      "TicketSummary": map['ticketSummary'],
      'LoggedUser': map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic postStopWork(StopWorkDto dto, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": "StopWork",
      "EventID": dto.eventId,
      "TechID": dto.techId,
      "TicketID": dto.ticketId,
      "Date": dto.date,
      "Time": dto.time,
      "GPS": "${dto.gps!.latitude}, ${dto.gps!.longitude}",
      "WorkPerformed": dto.workPerformed,
      "OverageReason": dto.overageReason,
      "TimeSpent": dto.timeSpent,
      "Charges": {
        "Hourly": dto.charges![0],
        "Trip": dto.charges![1],
        "Other": dto.charges![2],
        "Total": dto.charges![3],
      },
      // 'CloseEvent': 'N',
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic postNrcInvoice(Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command": "Invoice",
      "Subcommand1": "NRCInvoice",
      "Email": map['email'],
      "CustomerID": map['customerId'],
      "NRC": [map['nrc']]
    };
    return await getApi(dataUrl);
  }

  dynamic closeTicket(Map<String, dynamic> map) async {
    dynamic dataUrl = {
      "Command": "Ticket",
      "Subcommand1": "Update",
      "TicketID": map['ticketID'],
      "UserID": map['userID'],
      "NewStatus": 'CLOSED',
      "AssignedTo": map['assignedTo'],
      "Priority": map['priority'],
      "Category": map['category'],
      "LoggedUser": map['userID'],
    };
    return await getApi(dataUrl);
  }
}
