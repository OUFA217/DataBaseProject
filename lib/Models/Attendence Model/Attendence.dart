// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Attendance {
  final int attendanceId;
  final int studentId;
  final int professorId;

  Attendance({
    this.attendanceId = 1,
    this.studentId = 1,
    this.professorId = 1,
  });

  Attendance copyWith({
    int? attendanceId,
    int? studentId,
    int? professorId,
  }) {
    return Attendance(
      attendanceId: attendanceId ?? this.attendanceId,
      studentId: studentId ?? this.studentId,
      professorId: professorId ?? this.professorId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendanceId': attendanceId,
      'studentId': studentId,
      'professorId': professorId,
    };
  }

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      attendanceId: map['attendanceId'] as int,
      studentId: map['studentId'] as int,
      professorId: map['professorId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Attendance.fromJson(String source) =>
      Attendance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Attendance(attendanceId: $attendanceId, studentId: $studentId, professorId: $professorId)';

  @override
  bool operator ==(covariant Attendance other) {
    if (identical(this, other)) return true;

    return other.attendanceId == attendanceId &&
        other.studentId == studentId &&
        other.professorId == professorId;
  }

  @override
  int get hashCode =>
      attendanceId.hashCode ^ studentId.hashCode ^ professorId.hashCode;
}
