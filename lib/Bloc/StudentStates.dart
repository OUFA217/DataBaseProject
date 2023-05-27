import 'package:studentsystem/Student%20Model/SudentModel.dart';

abstract class SuperStudentState {}

class InitialStudentState extends SuperStudentState {}

class InsertingStudentState extends SuperStudentState {}

class StudentInsertedState extends SuperStudentState {}

class UpdatingStudentState extends SuperStudentState {}

class StudentUpdatedState extends SuperStudentState {}

class DeletingStudentState extends SuperStudentState {}

class StudentDeletedState extends SuperStudentState {}

class LoadingStudentsState extends SuperStudentState {}

class StudentsLoadedState extends SuperStudentState {
  StudentsLoadedState({required List<Student> students});
}

class LoadingStudentByIdState extends SuperStudentState {}

class StudentLoadedByIdState extends SuperStudentState {
  final Student student;

  StudentLoadedByIdState({required this.student});
}

class SearchingStudentsState extends SuperStudentState {
  final String query;

  SearchingStudentsState({required this.query});
}

class StudentsSearchedState extends SuperStudentState {
  StudentsSearchedState({required List<Student> students});
}
