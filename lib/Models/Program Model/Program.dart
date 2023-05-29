class Program {
  final int programId;
  final String name;
  final String requiredCourses;
  final String description;

  Program({
    this.programId = 1,
    this.name = "Computer Sceince",
    this.requiredCourses = "CSCI305",
    this.description = "DataBase System",
  });

  Map<String, dynamic> toMap() {
    return {
      'ID_program': programId,
      'name_program': name,
      'Required_courses': requiredCourses,
      'description_program': description,
    };
  }

  factory Program.fromMap(Map<String, dynamic> map) {
    return Program(
      programId: map['ID_program'],
      name: map['name_program'],
      requiredCourses: map['Required_courses'],
      description: map['description_program'],
    );
  }
}
