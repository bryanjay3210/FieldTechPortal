import 'package:flutter/widgets.dart';
import 'package:ft/services/api_service/api_request.dart';
import '../../../models/event/travel_dto.dart';

class ServiceCallDetailsRepo extends RequestApi {
  ServiceCallDetailsRepo(super.server);

  dynamic getServiceCall(Map<String, dynamic> map,
      {BuildContext? context}) async {
    dynamic dataUrl = {
      "Command": "Ticket",
      "Subcommand1": "Retrieve",
      "TicketID": map['ticketId']
    };
    return await getApi(dataUrl, context: context);
  }

  dynamic getEvent(Map<String, dynamic> map, {BuildContext? context}) async {
    dynamic dataUrl = {
      "Command": "Events",
      "Subcommand1": "Fetch",
      "EventID": map['eventId'],
      "withCustomer": "Y",
      "withGeolocation": "Y",
      "LoggedUser": map['techId']
    };

    return await getApi(dataUrl, context: context);
  }

  dynamic postTravel(TravelDto dto, BuildContext context) async {
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": dto.travelType,
      "TicketID": dto.ticketId,
      "EventID": dto.eventId,
      "TechID": dto.techId,
      "GeoLat": "${dto.position!.latitude}",
      "GeoLon": "${dto.position!.longitude}",
    };
    return await getApi(dataUrl, context: context);
  }

  getTechnician(Map<String, dynamic> map, BuildContext context) async{
    dynamic dataUrl = {
      "Command": "Technician",
      "Subcommand1": 'FetchList',
      "Date": map['date'],
      "RegionID": map['regionId'],
      "ExcludeUser":"Y",
      "LoggedUser": map['userId'],
    };
    return await getApi(dataUrl, context: context);
  }

  reassignTicket(Map<String, dynamic> map, BuildContext context) async{
    dynamic dataUrl = {
      "Command": "Schedule",
      "Subcommand1": 'Event',
      "EventDate": map['eventDate'],
      "EventID": map['eventID'],
      "TechID": map['techID'],
      "EventStart": map['eventStart'],
      "EventEnd": map['eventEnd'],
      "ReAssign": 'Y',
      'LoggedUser': map['userId']
    };
    return await getApi(dataUrl, context: context);
  }
}
