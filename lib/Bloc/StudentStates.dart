abstract class SuperStudentState {}

class InitialStudentState extends SuperStudentState {}

class CreatingStudentStateSuccess extends SuperStudentState {}

class InsertingStudentState extends SuperStudentState {}

class StudentInsertedState extends SuperStudentState {}

class UpdatingStudentState extends SuperStudentState {}

class StudentUpdatedState extends SuperStudentState {}

class DeletingStudentState extends SuperStudentState {}

class StudentDeletedState extends SuperStudentState {}

class LoadingStudentsState extends SuperStudentState {}

class StudentsLoadedState extends SuperStudentState {}

class Clearr extends SuperStudentState {}

class LoadingStudentByIdState extends SuperStudentState {}

class StudentLoadedByIdState extends SuperStudentState {}

class SearchingStudentsState extends SuperStudentState {}

class StudentsSearchedState extends SuperStudentState {}

class StudentsSearchedStateError extends SuperStudentState {
  final String error;

  StudentsSearchedStateError(this.error);
}

class AllRecordsDeletedState extends SuperStudentState {}

class AllRecordsDeletedStateError extends SuperStudentState {
  final String error;

  AllRecordsDeletedStateError(this.error);
}
