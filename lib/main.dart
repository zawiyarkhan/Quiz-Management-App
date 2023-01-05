import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Controllers/google_signIn_provider.dart';
import 'package:quiz_app/Controllers/question_list.dart';
import 'package:quiz_app/Model/api_calls.dart';
import 'package:quiz_app/Views/AuthenticationPages/GooglePage.dart';
import 'package:quiz_app/Views/AuthenticationPages/register.dart';
import 'package:quiz_app/Views/BottomPages/home.dart';
import 'package:quiz_app/Views/QuizMaking/choose_question.dart';
import 'package:quiz_app/Views/QuizMaking/quiz_info.dart';
import 'package:quiz_app/Views/main_navigation_page.dart';
import 'package:quiz_app/Views/quiz_joining_page.dart';
import 'package:quiz_app/Views/quiz_room.dart';

import 'Views/AuthenticationPages/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //final db = FirestoreAPI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => GoogleSignInProvider())),
        ChangeNotifierProvider(create: ((context) => QuestionsList()))
      ],
      //create: (context) => GoogleSignInProvider(),
      child: GetMaterialApp(
        title: 'Quixlet',
        theme: ThemeData(
          useMaterial3: true,
          //primarySwatch: Colors.blue,
        ),
        home: const GoogleRegister(),
      ),
    );
  }
}
