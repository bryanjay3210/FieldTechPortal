import 'package:geolocator/geolocator.dart';

class StopWorkDto {
  StopWorkDto(
    this.server, {
    this.eventId,
    this.techId,
    this.customerId,
    this.date,
    this.time,
    this.gps,
    this.workPerformed,
    this.overageReason,
    this.timeSpent,
    this.charges,
    this.ticketId,
  });

  final String? eventId;
  final String? techId;
  final String? customerId;
  final String? date;
  final String? time;
  final Position? gps;
  final String? workPerformed;
  final String? overageReason;
  final String? timeSpent;
  final List<String>? charges;
  final String? ticketId;
  final int server;

  @override
  String toString() {
    return 'StopWorkDto(eventId: $eventId, techId: $techId, customerId: $customerId, date: $date, time: $time, gpsLat: ${gps!.latitude}, gpsLong: ${gps!.longitude}, workPerformed: $workPerformed ,overageReason: $overageReason, timeSpent: $timeSpent, charges: $charges, ticketId: $ticketId)';
  }
}
