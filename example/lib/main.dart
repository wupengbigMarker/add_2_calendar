/*
 * @Description: 
 * @Author: wp
 * @Date: 2024-04-17 12:25:04
 * @LastEditors: Wp
 * @LastEditTime: 2024-11-05 09:12:52
 * @FilePath: /example/lib/main.dart
 */
import 'package:flutter/material.dart';

import 'package:add_2_calendar/add_2_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  MyApp({super.key});

  String eventID = "";

  final startDate = DateTime.fromMillisecondsSinceEpoch(
                1730772000000);
            final endDate = DateTime.fromMillisecondsSinceEpoch(
                1730775600000);
  Event buildEvent({Recurrence? recurrence}) {
    return Event(
      title: 'Test event',
      description: 'example',
      location: 'Flutter app',
      startDate: startDate,
      endDate: endDate,
      allDay: false,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
        url: "http://example.com",
      ),
      androidParams: const AndroidParams(
        emailInvites: ["test@example.com"],
      ),
      recurrence: recurrence,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add event to calendar example'),
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Add normal event'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () {
                Add2Calendar.addEvent2Cal(
                  buildEvent(),
                ).then((val){
                  eventID = val;
                  debugPrint("eventId is:----$eventID");
                });
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Delete event'),
              subtitle: const Text("watch out"),
              trailing: const Icon(Icons.calendar_today),
              onTap: () {
                Add2Calendar.deleteEvent(eventID);
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
