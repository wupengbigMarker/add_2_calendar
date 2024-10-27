/*
 * @Description: 
 * @Author: wp
 * @Date: 2024-04-17 12:25:04
 * @LastEditors: Wp
 * @LastEditTime: 2024-10-25 16:25:23
 * @FilePath: /addToCalendar/lib/src/add_2_cal.dart
 */
import 'dart:async';

import 'package:add_2_calendar/src/model/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Add2Calendar {
  static const MethodChannel _channel = MethodChannel('add_2_calendar');

  /// Add an Event (object) to user's default calendar.
  static Future<String> addEvent2Cal(Event event) async {
    return _channel
        .invokeMethod<String?>('add2Cal', event.toJson())
        .then((value) => value ?? "");
  }

  static Future<bool> deleteEvent(String eventId) async {
    try {
      final bool result = await _channel.invokeMethod('deleteCalendarEvent', {'eventId': eventId});
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to delete event: ${e.message}");
      return false;
    }
  }
}
