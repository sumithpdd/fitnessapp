import 'package:fitnessapp/enums/appointment_type.dart';

class MyAppointments {
  final String title;
  final AppointmentType appointmentType;
  final DateTime eventDate;
  final String? description;
  final String? information;
  final String? location;
  final String? photos;

  const MyAppointments(
    this.title,
    this.appointmentType,
    this.eventDate,
    this.description,
    this.information,
    this.location,
    this.photos,
  );
}
