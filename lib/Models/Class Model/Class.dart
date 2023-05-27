class Class {
  final int classId;
  final String courseId;
  final String professorName;
  final String startTime;
  final String endTime;
  final String dayOfWeek;
  final int programId;
  final int professorId;

  Class({
    required this.classId,
    required this.courseId,
    required this.professorName,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
    required this.programId,
    required this.professorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'class_id': classId,
      'course_id': courseId,
      'professor_name': professorName,
      'start_time': startTime,
      'end_time': endTime,
      'day_of_week': dayOfWeek,
      'courses_id': programId,
      'professor_id': professorId,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      classId: map['class_id'],
      courseId: map['course_id'],
      professorName: map['professor_name'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      dayOfWeek: map['day_of_week'],
      programId: map['courses_id'],
      professorId: map['professor_id'],
    );
  }
}
