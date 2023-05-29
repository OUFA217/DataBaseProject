import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:studentsystem/Bloc/StudentCubit.dart';
import 'package:studentsystem/Bloc/StudentStates.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  List chapters = [
    'Introduction',
    'Adobe XD',
    'Sketch Basics',
    'Figma Mastery',
  ];

  List topics = [
    'Introduction to the course',
    'Detailed tutorials on adobe XD',
    'Introduction to the course',
    'Sketch beginner to expert series',
    'Figma from basic to advanced',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: BlocConsumer<StudentCubit, SuperStudentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).hintColor,
            appBar: AppBar(
              title: const Text('Course Details',
                  style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Design Tool Bundle'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const ProfilePicture(
                        name: "Khaled Ashraf", radius: 31, fontsize: 21),
                    title: Text(
                      StudentCubit.Name[0]["FirstName"] +
                          StudentCubit.Name[0]["LastName"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Lead Instructor',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: chapters.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(239, 158, 158, 158),
                                offset: Offset(0, 0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text(
                                '$index',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              chapters[index].toString().toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              topics[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
