import 'dart:collection';

import 'package:fitnessapp/enums/appointment_type.dart';
import 'package:fitnessapp/models/my_appointments.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final dummyAppointments = LinkedHashMap<DateTime, List<MyAppointments>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1,
        (index) => MyAppointments(
            'Event $item | ${index + 1}',
            AppointmentType.Gym,
            DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
            "",
            "",
            "",
            "")))
  ..addAll({
    kToday: [
      MyAppointments(
          'todays', AppointmentType.PersonalTraining, kToday, "", "", "", ""),
      MyAppointments(
          'todays yoga', AppointmentType.Yoga, kToday, "", "", "", ""),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
