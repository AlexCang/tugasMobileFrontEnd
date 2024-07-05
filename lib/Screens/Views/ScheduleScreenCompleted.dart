import 'package:flutter/material.dart';
import 'package:medical/Screens/Widgets/ScheduleCard.dart';
import 'package:provider/provider.dart';
import 'package:medical/Screens/Views/Appointment.dart';
import 'package:medical/Screens/Views/appointment_provider.dart'; // Sesuaikan dengan path yang sesuai // Sesuaikan dengan path yang sesuai

class ScheduleScreenCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointmentProvider =
        Provider.of<AppointmentProvider>(context, listen: true);
    final List<Appointment> completedAppointments =
        appointmentProvider.completedAppointments;
    final List<Appointment> upcomingAppointments =
        appointmentProvider.upcomingAppointments;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 121, 121),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Other widgets here
            ListView.builder(
              shrinkWrap: true,
              itemCount:
                  completedAppointments.length + upcomingAppointments.length,
              itemBuilder: (context, index) {
                if (index < completedAppointments.length) {
                  Appointment appointment = completedAppointments[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0), // Adds space between cards
                      child: shedule_card(
                        mainText: appointment.doctorName,
                        subText: appointment.specialty,
                        date: appointment.date,
                        time: appointment.time,
                        confirmation: 'Confirmed',
                        image: appointment.image,
                      ));
                } else {
                  Appointment appointment = upcomingAppointments[
                      index - completedAppointments.length];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0), // Adds space between cards
                      child: shedule_card(
                        mainText: appointment.doctorName,
                        subText: appointment.specialty,
                        date: appointment.date,
                        time: appointment.time,
                        confirmation: 'Confirmed',
                        image: appointment.image,
                      ));
                }
                // Your code here
              },
            ),
          ],
        ),
      ),
    );
  }
}
