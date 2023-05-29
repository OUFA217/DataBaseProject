class Student {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String dateOfBirth;
  int programId;
  int paymentId;

  Student({
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
