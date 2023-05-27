class Course {
  final String courseName;
  final int courseId;
  final String department;

  Course({
    required this.courseName,
    required this.courseId,
    required this.department,
  });

  Map<String, dynamic> toMap() {
    return {
      'Course_name': courseName,
      'courses_id': courseId,
      'department': department,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseName: map['Course_name'],
      courseId: map['courses_id'],
      department: map['department'],
    );
  }
}
