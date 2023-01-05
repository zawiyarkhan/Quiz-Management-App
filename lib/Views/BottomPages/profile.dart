// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Controllers/google_signIn_provider.dart';

final QuizUserData = FirebaseFirestore.instance.collection("Users");

class Profile extends StatefulWidget {
  var user;
  Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userQuiz;

  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    QuizUserData.doc(widget.user.uid).get().then((DocumentSnapshot doc) {
      userQuiz = doc.data();
      print(userQuiz);
      print(userQuiz['quizAttempted'].keys.toList());
      //print(userQuiz['quizAttempted'].values.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 10),
                  child: TextButton.icon(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.Logout();
                    },
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Logout",
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.user.photoURL),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${widget.user.displayName}",
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${widget.user.email}",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    "Quiz",
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                    label: Text(
                  "Score",
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(
                    "Quiz 1",
                    style: GoogleFonts.roboto(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    "23",
                    style: GoogleFonts.roboto(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    "Quiz 2",
                    style: GoogleFonts.roboto(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    "21",
                    style: GoogleFonts.roboto(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    "Quiz 2",
                    style: GoogleFonts.roboto(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                  DataCell(Text(
                    "22",
                    style: GoogleFonts.roboto(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
                ]),
              ],
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
