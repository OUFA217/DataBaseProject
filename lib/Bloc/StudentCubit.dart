// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studentsystem/Bloc/StudentStates.dart';
import 'package:studentsystem/Models/Professor%20Model/Proffesor.dart';
import 'package:studentsystem/Models/Student%20Model/SudentModel.dart';

class StudentCubit extends Cubit<SuperStudentState> {
  StudentCubit() : super(InitialStudentState());

  static StudentCubit get(context) => BlocProvider.of(context);

  Database? db;
  Professor professor = Professor(
      professorId: 1,
      firstName: "Osama",
      lastName: "Aziz",
      department: "Computer Science",
      email: "OsamaAziz@nu.edu.eg",
      phoneNumber: "0100000000");
  void createDatabase() async {
    await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print('database created');
        await db!.execute('''
      CREATE TABLE Students (
        Student_Id INTEGER PRIMARY KEY,
        First_Name TEXT,
        Last_Name TEXT,
        Phone_Number TEXT,
        Email TEXT,
        Date_of_birth TEXT,
        ID_program INTEGER,
        Payment_ID INTEGER,
        FOREIGN KEY      (ID_program) REFERENCES Program(ID_program),
        FOREIGN KEY (Payment_ID) REFERENCES finance(Payment_id)
      )
    ''');

        await db!.execute('''
      CREATE TABLE Program (
        ID_program INTEGER PRIMARY KEY,
        name_program TEXT,
        Required_courses TEXT,
        description_program TEXT
      )
    ''');

        await db!.execute('''
      CREATE TABLE courses (
        Course_name TEXT PRIMARY KEY,
        courses_id INTEGER,
        department TEXT
      )
    ''');

        await db!.execute('''
      CREATE TABLE Enrollment (
        Enrollment_id INTEGER PRIMARY KEY,
        Student_Id INTEGER,
        Course_id TEXT,
        FOREIGN KEY (Student_Id) REFERENCES Students(Student_Id),
        FOREIGN KEY (Course_id) REFERENCES courses(Course_name)
      )
    ''');

        await db!.execute('''
      CREATE TABLE Professors (
        Professor_id INTEGER PRIMARY KEY,
        First_Name TEXT,
        Last_Name TEXT,
        department TEXT,
        Email TEXT,
        Phone_Number TEXT
      )
    ''');

        await db!.execute('''
      CREATE TABLE classes (
        class_id INTEGER PRIMARY KEY,
        course_id TEXT,
        professor_name TEXT,
        start_time TEXT,
        end_time TEXT,
        day_of_week TEXT,
        courses_id INTEGER,
        professor_id INTEGER,
        FOREIGN KEY (course_id) REFERENCES courses(Course_name),
        FOREIGN KEY (courses_id) REFERENCES Program(ID_program),
        FOREIGN KEY (professor_id) REFERENCES Professors(Professor_id)
     )
    ''');

        await db!.execute('''
      CREATE TABLE attendance (
        Attendance_id INTEGER PRIMARY KEY,
        Student_id INTEGER,
        Professor_id INTEGER,
        FOREIGN KEY (Student_id) REFERENCES Students(Student_Id),
        FOREIGN KEY (Professor_id) REFERENCES Professors(Professor_id)
      )
    ''');

        await db!.execute('''
      CREATE TABLE finance (
        Payment_id INTEGER PRIMARY KEY,
        f_type TEXT,
        amount_paid REAL,
        payment_date TEXT
      )
    ''');

        await db!.execute('''
      ALTER TABLE Students
      ADD CONSTRAINT fk_Students_Program
      FOREIGN KEY (ID_program) REFERENCES Program(ID_program)
    ''');

        await db!.execute('''
      ALTER TABLE Students
      ADD CONSTRAINT fk_Students_finance
      FOREIGN KEY (Payment_ID) REFERENCES finance(Payment_id)
    ''');

        await db!.execute('''
      ALTER TABLE Enrollment
      ADD CONSTRAINT fk_Enrollment_Students
      FOREIGN KEY (Student_Id) REFERENCES Students(Student_Id)
    ''');

        await db!.execute('''
      ALTER TABLE Enrollment
      ADD CONSTRAINT fk_Enrollment_courses
      FOREIGN KEY (Course_id) REFERENCES courses(Course_name)
    ''');

        await db!.execute('''
      ALTER TABLE classes
      ADD CONSTRAINT fk_classes_courses
      FOREIGN KEY (course_id) REFERENCES courses(Course_name)
    ''');

        await db!.execute('''
      ALTER TABLE classes
      ADD CONSTRAINT fk_classes_Professors
      FOREIGN KEY (professor_id) REFERENCES Professors(Professor_id)
    ''');

        await db!.execute('''
      ALTER TABLE classes
      ADD CONSTRAINT fk_classes_Program
      FOREIGN KEY (courses_id) REFERENCES Program(ID_program)
    ''');

        await db!.execute('''
      ALTER TABLE attendance
      ADD CONSTRAINT fk_attendance_Students
      FOREIGN KEY (Student_id) REFERENCES Students(Student_Id)
    ''');

        await db!.execute('''
      ALTER TABLE attendance
      ADD CONSTRAINT fk_attendance_Professors
      FOREIGN KEY (Professor_id) REFERENCES Professors(Professor_id)
    ''');
        await db!.insert('Professors', professor.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      },
      onOpen: (db) {},
    );
  }

  Future<void> insertStudent(Student student) async {
    emit(InsertingStudentState());

    await db!.insert('Students', student.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    emit(StudentInsertedState());
  }

  Future<void> updateStudent(Student student) async {
    emit(UpdatingStudentState());

    await db!.update('Students', student.toMap(),
        where: 'Student_Id = ?', whereArgs: [student.id]);

    emit(StudentUpdatedState());
  }

  Future<void> deleteStudent(int id) async {
    emit(DeletingStudentState());

    await db!.delete('Students', where: 'Student_Id = ?', whereArgs: [id]);

    emit(StudentDeletedState());
  }

  List<Map> Students = [];
  void getStudents() async {
    emit(LoadingStudentsState());
    Students = [];
    db!.rawQuery('Select * From Students').then((value) {
      value.forEach((element) {
        Students.add(element);
      });
    });
  }

  Future<Student> getStudentById(int id) async {
    emit(LoadingStudentByIdState());

    final List<Map<String, dynamic>> maps = await db!.query(
      'Students',
      where: 'Student_Id = ?',
      whereArgs: [id],
    );

    final student = Student(
      id: maps[0]['Student_Id'],
      firstName: maps[0]['First_Name'],
      lastName: maps[0]['Last_Name'],
      phoneNumber: maps[0]['Phone_Number'],
      email: maps[0]['Email'],
      dateOfBirth: maps[0]['Date_of_birth'],
      programId: maps[0]['ID_program'],
      paymentId: maps[0]['Payment_ID'],
    );

    emit(StudentLoadedByIdState(student: student));

    return student;
  }

  Future<List<Student>> searchStudents(String query) async {
    emit(SearchingStudentsState(query: query));

    final List<Map<String, dynamic>> maps = await db!.query(
      'Students',
      where: 'First_Name LIKE ? OR Last_Name LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );

    final students = List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['Student_Id'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        phoneNumber: maps[i]['Phone_Number'],
        email: maps[i]['Email'],
        dateOfBirth: maps[i]['Date_of_birth'],
        programId: maps[i]['ID_program'],
        paymentId: maps[i]['Payment_ID'],
      );
    });

    emit(StudentsSearchedState(students: students));

    return students;
  }
}
