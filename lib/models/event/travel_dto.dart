import 'package:geolocator/geolocator.dart';

class TravelDto {
  TravelDto(
    this.server, {
    this.travelType,
    this.ticketId,
    this.eventId,
    this.techId,
    this.position,
  });

  final String? travelType;
  final String? ticketId;
  final String? eventId;
  final String? techId;
  final Position? position;
  final int server;
}
