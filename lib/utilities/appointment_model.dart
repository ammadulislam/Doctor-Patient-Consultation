class Appointment {
  final int appointmentId;
  final int doctorId;
  final String time;
  final int userId;
  final String fullName;
  final String emailAddress;
  final String gender;
  final String phoneNumber;

  Appointment({
    required this.appointmentId,
    required this.doctorId,
    required this.time,
    required this.userId,
    required this.fullName,
    required this.emailAddress,
    required this.gender,
    required this.phoneNumber,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointment_id'],
      doctorId: json['doctor_id'],
      time: json['Time'],
      userId: json['user_id'],
      fullName: json['full_name'],
      emailAddress: json['email_address'],
      gender: json['gender'],
      phoneNumber: json['phone_no'],
    );
  }
}
