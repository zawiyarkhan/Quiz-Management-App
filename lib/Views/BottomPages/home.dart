// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Views/QuizMaking/quiz_info.dart';
import 'package:quiz_app/Views/quiz_joining_page.dart';
import 'package:quiz_app/Views/widgets/selection_card.dart';

class Home extends StatefulWidget {
  var user;
  Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Heyy ${widget.user.displayName} 👋",
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Tap To Get Started",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SelectionCard(
                  text: 'Make a New Quiz',
                  page: () => QuizInfo(),
                ),
                SelectionCard(
                  text: 'Join a Quiz',
                  page: () => QuizJoining(),
                ),
                SelectionCard(
                  text: "Select Existing Quiz",
                  page: () => QuizJoining(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
