class Enrollment {
  final int enrollmentId;
  final int studentId;
  final String courseId;

  Enrollment({
    required this.enrollmentId,
    required this.studentId,
    required this.courseId,
  });

  Map<String, dynamic> toMap() {
    return {
      'Enrollment_id': enrollmentId,
      'Student_Id': studentId,
      'Course_id': courseId,
    };
  }

  factory Enrollment.fromMap(Map<String, dynamic> map) {
    return Enrollment(
      enrollmentId: map['Enrollment_id'],
      studentId: map['Student_Id'],
      courseId: map['Course_id'],
    );
  }
}
