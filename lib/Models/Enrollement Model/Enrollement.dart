class Enrollment {
  final int enrollmentId;
  final int studentId;
  final String courseId;

  Enrollment({
    this.enrollmentId = 1,
    this.studentId = 1,
    this.courseId = "CSCI305",
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
