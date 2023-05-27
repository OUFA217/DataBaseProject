class Attendance {
  final int attendanceId;
  final int studentId;
  final int professorId;

  Attendance({
    required this.attendanceId,
    required this.studentId,
    required this.professorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'Attendance_id': attendanceId,
      'Student_id': studentId,
      'Professor_id': professorId,
    };
  }

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      attendanceId: map['Attendance_id'],
      studentId: map['Student_id'],
      professorId: map['Professor_id'],
    );
  }
}
