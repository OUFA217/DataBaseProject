class Professor {
  final int professorId;
  final String firstName;
  final String lastName;
  final String department;
  final String email;
  final String phoneNumber;

  Professor({
    required this.professorId,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'Professor_id': professorId,
      'First_Name': firstName,
      'Last_Name': lastName,
      'department': department,
      'Email': email,
      'Phone_Number': phoneNumber,
    };
  }

  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      professorId: map['Professor_id'],
      firstName: map['First_Name'],
      lastName: map['Last_Name'],
      department: map['department'],
      email: map['Email'],
      phoneNumber: map['Phone_Number'],
    );
  }
}
