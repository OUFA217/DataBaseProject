import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentsystem/Observer/BlocObserver.dart';
import 'package:studentsystem/Presentation/Sign%20In/SignIn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STUDENT SYSTEM',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: const Color(0XFF584BDD),
        hintColor: const Color(0XFFFBF6FF),
      ),
      home: SignIn(),
    );
  }
}
