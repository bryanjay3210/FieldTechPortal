import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment.dart';
part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    @Default('') String EventID,
    @Default('') String TicketID,
    @Default('') String Name,
    @Default('') String EventStart,
    @Default('') String EventEnd,
    @Default('') String EventStatus,
    @Default('') dynamic Comment,

  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
