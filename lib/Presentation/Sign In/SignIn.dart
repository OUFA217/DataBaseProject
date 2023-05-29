import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentsystem/Bloc/StudentCubit.dart';
import 'package:studentsystem/Bloc/StudentStates.dart';
import 'package:studentsystem/General%20Components/Components.dart';
import 'package:studentsystem/Presentation/Dashboard/dashboard.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit()..createDatabase(),
      child: BlocConsumer<StudentCubit, SuperStudentState>(
        listener: (context, state) {},
        builder: (context, SuperStudentState state) {
          StudentCubit studentCubit = StudentCubit.get(context);

          return Scaffold(
            key: studentCubit.ScaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              title: const Text('NU Student Management'),
            ),
            body: ConditionalBuilder(
              condition: state != LoadingStudentsState,
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          TextFormField(
                            controller:
                                StudentCubit.get(context).emailController,
                            keyboardType: TextInputType.name,
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            onChanged: (String value) {
                              print(value);
                            },
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(
                                Icons.supervised_user_circle_rounded,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller:
                                StudentCubit.get(context).passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            onChanged: (String value) {
                              print(value);
                            },
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.deepPurple,
                            child: MaterialButton(
                              onPressed: () {
                                studentCubit.deleteAllRecords();
                                studentCubit.insertDatabase(
                                    FirstName: "Osama",
                                    LastName: "Aziz",
                                    Email: "Kh.Ashraf@nu.edu.eg",
                                    PhoneNumber: "01030262529",
                                    DateOfBirth: "21/7/2002",
                                    IdProgram: 1,
                                    PaymentId: 1);

                                studentCubit.getStudentById(1).then((value) =>
                                    Navigation(context, Dashboard()));
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
