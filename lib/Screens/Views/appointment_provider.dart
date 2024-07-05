import 'package:flutter/material.dart';
import 'package:medical/Screens/Views/Appointment.dart';

class AppointmentProvider with ChangeNotifier {
  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners(); // Ensure this notifies listeners of changes
  }

  void removeLastAppointment() {
    if (_appointments.isNotEmpty) {
      _appointments.removeLast();
      notifyListeners(); // Ensure this notifies listeners of changes
    }
  }

  List<Appointment> _appointments = [
    Appointment(
      doctorName: "Dr. Marcus Horizon",
      specialty: "Cardiologist",
      date: "10/07/2024",
      time: "10:00 AM",
      status: AppointmentStatus.completed,
      image: 'lib/icons/male-doctor.png',
    ),
    Appointment(
      doctorName: "Dr. Maria Elena",
      specialty: "Dermatologist",
      date: "11/07/2024",
      time: "11:00 AM",
      status: AppointmentStatus.upcoming,
      image: 'lib/icons/docto3.png',
    ),
    // Tambahkan lebih banyak data sesuai kebutuhan
  ];

  List<Appointment> get completedAppointments {
    return _appointments
        .where(
            (appointment) => appointment.status == AppointmentStatus.completed)
        .toList();
  }

  List<Appointment> get upcomingAppointments {
    return _appointments
        .where(
            (appointment) => appointment.status == AppointmentStatus.upcoming)
        .toList();
  }
}
