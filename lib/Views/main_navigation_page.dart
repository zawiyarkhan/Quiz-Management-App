// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:quiz_app/Model/user_model.dart';
import 'package:quiz_app/Views/BottomPages/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'BottomPages/home.dart';

class MainNavigation extends StatefulWidget {
  var user;
  MainNavigation({super.key, required this.user});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  //final user = FirebaseAuth.instance.currentUser;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    //makeNewUser();
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          Home(
            user: widget.user,
          ),
          Profile(
            user: widget.user,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        //color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GNav(
              selectedIndex: selectedIndex,
              onTabChange: onItemClicked,
              gap: 4,
              backgroundColor: Colors.white,
              //tabBackgroundColor: Colors.grey.shade600,
              color: Colors.black,
              activeColor: Colors.black,
              //rippleColor: Colors.black,
              //hoverColor: Colors.black,
              padding: EdgeInsets.all(8),
              tabs: [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                  textStyle: GoogleFonts.roboto(fontSize: 20),
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  //textSize: 25,
                  textStyle: GoogleFonts.roboto(fontSize: 20),
                ),
              ]),
        ),
      ),
    );
  }
}
