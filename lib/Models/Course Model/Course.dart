class Course {
  final String courseName;
  final int courseId;
  final String department;

  Course({
    this.courseName = "CSCI305",
    this.courseId = 1,
    this.department = "Computer Science",
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
