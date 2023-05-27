class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String dateOfBirth;
  final int programId;
  final int paymentId;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.programId,
    required this.paymentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'Student_Id': id,
      'First_Name': firstName,
      'Last_Name': lastName,
      'Phone_Number': phoneNumber,
      'Email': email,
      'Date_of_birth': dateOfBirth,
      'ID_program': programId,
      'Payment_ID': paymentId,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['Student_Id'],
      firstName: map['First_Name'],
      lastName: map['Last_Name'],
      phoneNumber: map['Phone_Number'],
      email: map['Email'],
      dateOfBirth: map['Date_of_birth'],
      programId: map['ID_program'],
      paymentId: map['Payment_ID'],
    );
  }
}
