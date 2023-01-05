// okay so this is it

// define functions for different tables e.g python

// make one function that does all the magic

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/Model/question_model.dart';
import 'package:quiz_app/Model/quiz_model.dart';

Stream<List<QuestionModel>> readPythonData() => FirebaseFirestore.instance
    .collection('Python')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => QuestionModel.fromJson(doc.data()))
        .toList());

Stream<List<QuestionModel>> readDBData() => FirebaseFirestore.instance
    .collection('DatabaseManagement')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => QuestionModel.fromJson(doc.data()))
        .toList());

Stream<List<QuestionModel>> readOSData() => FirebaseFirestore.instance
    .collection('Operating System')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => QuestionModel.fromJson(doc.data()))
        .toList());

Stream<List<QuestionModel>> readJavaData() => FirebaseFirestore.instance
    .collection('Java')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => QuestionModel.fromJson(doc.data()))
        .toList());

Stream<List<QuestionModel>> readQuestionData(String? value) =>
    FirebaseFirestore.instance.collection(value as String).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => QuestionModel.fromJson(doc.data()))
            .toList());


Stream<List<QuizModel>> readQuizData() =>
    FirebaseFirestore.instance.collection("Quizes").snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => QuizModel.fromJson(doc.data()))
            .toList());

// Stream<List<QuizModel>> readQuizData(String code) =>
//     FirebaseFirestore.instance.collection("Quizes").doc(code).snapshots().map(
//         (snapshot) => snapshot.docs
//             .map((doc) => QuestionModel.fromJson(doc.data()))
//             .toList());