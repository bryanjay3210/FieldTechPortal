class EventDto {
  EventDto(this.server,
      {this.date, this.eventId, this.changedReason, this.techId});
  final int server;
  final String? eventId;
  final String? changedReason;
  final String? techId;
  final DateTime? date;
}
