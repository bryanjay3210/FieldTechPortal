import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'customer_event.freezed.dart';
part 'customer_event.g.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  factory CustomerEvent({
    @Default('') dynamic EventID,
    @Default('') dynamic CustomerID,
    @Default('') dynamic EventStartTime,
    @Default('') dynamic EventEndTime,
    @Default('') dynamic EventOwnerID,
    @Default('') dynamic EventType,
    @Default('') dynamic EventDesc,
    @Default('') dynamic EventLoc,
    @Default('') dynamic EventNote,
    @Default('') dynamic EventStatus,
    @Default('') dynamic EventPriority,
    @Default('') dynamic email,
  }) = _CustomerEvent;

  factory CustomerEvent.fromJson(Map<String, dynamic> json) =>
      _$CustomerEventFromJson(json);
}
