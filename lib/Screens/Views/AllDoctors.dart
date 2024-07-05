import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/DocDetail1.dart';
import 'package:medical/Screens/Views/HomePage.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math';

import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorSearch extends StatefulWidget {
  const DoctorSearch({Key? key}) : super(key: key);

  @override
  _DoctorSearchState createState() => _DoctorSearchState();
}

class _DoctorSearchState extends State<DoctorSearch> {
  List<Widget> doctorList = [];

  @override
  void initState() {
    super.initState();
    doctorList = _buildDoctorList();
  }

  List<Widget> _buildDoctorList() {
    return [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoctorDetails()),
          );
        },
        child: const DoctorList(
          distance: "800m Away",
          image: "lib/icons/male-doctor.png",
          maintext: "Dr. Marcus Horizon",
          numRating: "4.7",
          subtext: "Cardiologist",
        ),
      ),
      const DoctorList(
        distance: "800m Away",
        image: "lib/icons/docto3.png",
        maintext: "Dr. Maria Elena",
        numRating: "4.7",
        subtext: "Dermatologist",
      ),
      const DoctorList(
        distance: "800m Away",
        image: "lib/icons/doctor2.png",
        maintext: "Dr. Stevi Jessi",
        numRating: "4.7",
        subtext: "Neurologist",
      ),
      const DoctorList(
        distance: "800m Away",
        image: "lib/icons/black-doctor.png",
        maintext: "Dr. Singh",
        numRating: "4.7",
        subtext: "Gastroenterologist",
      ),
    ];
  }

  void _refreshDoctorsData() {
    setState(() {
      doctorList.shuffle(Random());
    });

    print("Doctors data refreshed");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(type: PageTransitionType.fade, child: Homepage()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8), // Padding around the image
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
                  .withOpacity(0.3), // Background color behind the image
            ),
            child: Image.asset(
              "lib/icons/back1.png",
              width: 10, // Adjust the size of the image
              height: 10,
            ),
          ),
        ),
        title: Text(
          "Top Doctors",
          style: GoogleFonts.poppins(fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PopupMenuButton<int>(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Image.asset(
                  "lib/icons/more.png",
                  width: 24,
                  height: 24,
                ),
              ),
              onSelected: (int value) {
                // Handle the selected menu option
                if (value == 0) {
                  _refreshDoctorsData();
                } else if (value == 1) {
                  // Do something for Schedule
                } else if (value == 2) {
                  // Do something for Report
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Refresh'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Schedule'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Report'),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: theme.colorScheme.surface,
      ),
      body: ListView.builder(
        itemCount: doctorList.length,
        itemBuilder: (context, index) => doctorList[index],
      ),
    );
  }
}
