// Di file Appointment.dart atau di mana Anda mendefinisikan model Appointment
enum AppointmentStatus {
  upcoming,
  completed,
  canceled,
}

class Appointment {
  final String image;
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final AppointmentStatus status;

  Appointment({
    required this.image,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.status, // Pastikan status sudah ditambahkan di constructor
  });
}
