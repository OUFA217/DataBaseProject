import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:studentsystem/Bloc/StudentCubit.dart';
import 'package:studentsystem/Bloc/StudentStates.dart';
import '../Course_Details/course_details.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: BlocConsumer<StudentCubit, SuperStudentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (StudentCubit.Name.isNotEmpty) {
            print("First Name: ${StudentCubit.Name[0]["FirstName"]}");
            print("Last Name: ${StudentCubit.Name[0]["LastName"]}");
          }
          return Scaffold(
            backgroundColor: Theme.of(context).hintColor,
            appBar: AppBar(
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: ProfilePicture(
                      name: "${StudentCubit.Name[0]["FirstName"]} " +
                          "${StudentCubit.Name[0]["LastName"]}",
                      // StudentCubit.Name![0]["FirstName"] +
                      //     StudentCubit.Name![0]["LastName"]
                      // "Khaled Ashraf",
                      radius: 31,
                      fontsize: 21,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'My Courses'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Expanded(
                    child: ConditionalBuilder(
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                      condition: StudentCubit.Students.isNotEmpty,
                      builder: (context) {
                        return ListView.builder(
                          itemCount: StudentCubit.Students.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Material(
                                  child: InkWell(
                                    highlightColor: Colors.white.withAlpha(50),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CourseDetails(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            'assets/img/$index.png',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "KHALED",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                              ),
                                              const Text(
                                                'Adobe XD, Sketch, Figma',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.grey[300],
                                                height: 25,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child:
                                                          LinearPercentIndicator(
                                                        animation: true,
                                                        lineHeight: 5.0,
                                                        animationDuration: 2500,
                                                        percent: 0.7,
                                                        backgroundColor:
                                                            Colors.grey[200],
                                                        progressColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const Column(
                                                    children: <Widget>[
                                                      Text('70 %'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
