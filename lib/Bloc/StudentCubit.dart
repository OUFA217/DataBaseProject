// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:studentsystem/Bloc/StudentStates.dart';

class StudentCubit extends Cubit<SuperStudentState> {
  StudentCubit() : super(InitialStudentState());

  static StudentCubit get(context) => BlocProvider.of(context);
  var ScaffoldKey = GlobalKey<ScaffoldState>();

  Database? database;
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  void createDatabase() async {
    await openDatabase(
      'Students.db',
      version: 1,
      onCreate: (database, version) async {
        print("Database Executed");
        database
            .execute(
                'CREATE TABLE Students(StudentId INTEGER PRIMARY KEY,FirstName TEXT,LastName TEXT,Email TEXT, PhoneNumber TEXT,DateOfBirth TEXT,IdProgram INTEGER,PaymentId INTEGER )')
            .then((value) {
          print('Created Table');
        }).catchError((error) {
          print('Failed to Create Table${error.toString()}');
        });
      },
      onOpen: (database) {
        getdatafromDatabase(database);
        print('Database Opened');
      },
    ).then((value) {
      database = value;

      emit(CreatingStudentStateSuccess());
    });
  }

  Future<void> insertDatabase(
      {required String FirstName,
      required String LastName,
      required String Email,
      required String PhoneNumber,
      required String DateOfBirth,
      required int IdProgram,
      required int PaymentId}) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO Students(FirstName, LastName, Email, PhoneNumber,DateOfBirth,IdProgram,PaymentId ) VALUES("$FirstName","$LastName","$Email","$PhoneNumber","$DateOfBirth","$IdProgram","$PaymentId")',
      )
          .then((value) {
        print('$value Data is inserted');
        getdatafromDatabase(database);
        emit(InsertingStudentState());
      }).catchError((error) {
        print('Data inserted has a mistake ${error.toString()}');
      });
    });
  }

  static List<Map> Students = [];

  void getdatafromDatabase(database) {
    emit(LoadingStudentsState());
    database!.rawQuery('Select * From Students').then((value) {
      value.forEach((element) {
        Students.add(element);
      });
      print(Students);
      emit(StudentsLoadedState());
    });
  }

  static List<Map> Name = [];
  Future<void> getStudentById(int id) async {
    await database!
        .query('Students',
            columns: ['FirstName', 'LastName'],
            where: 'StudentId = ?',
            whereArgs: [id])
        .then((value) {
      print("$value has executed");
      Name = value; // Store the result in the Name list
      emit(StudentsSearchedState());
    }).catchError((error) {
      print('Student retrieved has a mistake ${error.toString()}');
      emit(StudentsSearchedStateError(error));
    });
  }

  void deleteAllRecords() {
    database!.delete('Students').then((value) {
      print('Deleted $value records');
      Students.clear(); // Clear the list of students
      emit(AllRecordsDeletedState());
    }).catchError((error) {
      print('Failed to delete records: ${error.toString()}');
      emit(AllRecordsDeletedStateError(error));
    });
  }
}
