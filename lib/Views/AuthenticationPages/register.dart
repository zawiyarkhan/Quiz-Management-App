// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Views/BottomPages/home.dart';
import 'package:quiz_app/Views/main_navigation_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Quixlet",
              style: GoogleFonts.satisfy(
                  fontSize: 60, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    //controller: _emailField,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Full Name",
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //controller: _emailField,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Username",
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //controller: _emailField,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () async {
                        // final user = User(name: _nameField.text, email: _emailField.text, contact: _contactField.text);
                        // bool create = await user.createUser();
                        // if (create){
                        //   Get.to(()=>const Home());
                        // }
                        //Get.to(() => MainNavigation());
                      },
                      style: OutlinedButton.styleFrom(
                          primary: const Color(0xFF030303),
                          fixedSize: Size(width, 40),
                          //fixedSize: const Size(100,100),
                          side: BorderSide(width: 1.3, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
