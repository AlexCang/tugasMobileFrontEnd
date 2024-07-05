import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/AllDoctors.dart';
import 'package:medical/Screens/Views/Article1.dart';
import 'package:medical/Screens/Views/DoctorSearchScreen.dart';
import 'package:medical/Screens/Views/articlePage.dart';
import 'package:medical/Screens/Widgets/Article.dart';
import 'package:medical/Screens/Widgets/Banner.dart';
import 'package:medical/Screens/Widgets/List_doctor1.dart';
import 'package:medical/Screens/Widgets/ListIcons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:medical/Screens/Views/Settings.dart';
import 'dart:async'; // Import for Timer

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  bool _showBanner = true; // State to control banner visibility

  @override
  void initState() {
    super.initState();
    // Set a timer to hide the banner after 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showBanner = false;
      });
    });
  }

  Future<void> _refreshData() async {
    // Simulate a network request or any async task
    await Future.delayed(Duration(seconds: 2));
    // Perform any actions you want on refresh here
  }

  void _showArticleBottomSheet(
    BuildContext context,
    String title,
    String content,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: DraggableScrollableSheet(
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      content,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.surface,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Image.asset(
                  "lib/icons/bell.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            SizedBox(height: 1),
            Text(
              "Find your desire\nhealth solution",
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        toolbarHeight: 130,
        elevation: 0,
      ),
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(),
                    child: TextField(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorSearchScreen(), // Navigate to DoctorSearchScreen
                          ),
                        );
                      },
                      textAlign: TextAlign.start,
                      textInputAction: TextInputAction.none,
                      autofocus: false,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        focusColor: const Color.fromRGBO(0, 0, 0, 0.259),
                        fillColor: theme.colorScheme.surface,
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            child: Image.asset(
                              "lib/icons/search.png",
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        labelText: "Search doctor, drugs, articles...",
                        prefixIconColor: theme.colorScheme.surface,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Body Start from here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    listIcons(Icon: "lib/icons/Doctor.png", text: "Doctor"),
                    listIcons(Icon: "lib/icons/Pharmacy.png", text: "Pharmacy"),
                    listIcons(Icon: "lib/icons/Hospital.png", text: "Hospital"),
                    listIcons(
                        Icon: "lib/icons/Ambulance.png", text: "Ambulance"),
                  ],
                ),
                SizedBox(height: 10),
                const banner(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Doctor",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DoctorSearch()), // Navigate to DoctorSearchScreen
                          );
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: const Color.fromARGB(255, 3, 190, 150),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 180,
                    width: 400,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        list_doctor1(
                          distance: '130m Away',
                          image: 'lib/icons/male-doctor.png',
                          maintext: 'Dr. Marcus Horizon',
                          numRating: '4.7',
                          subtext: 'Cardiologist',
                        ),
                        list_doctor1(
                          distance: '130m Away',
                          image: 'lib/icons/docto3.png',
                          maintext: 'Dr. Maria Elena',
                          numRating: '4.6',
                          subtext: 'Dermatologist',
                        ),
                        list_doctor1(
                          distance: '2km away',
                          image: 'lib/icons/doctor2.png',
                          maintext: 'Dr. Stevi Jessi',
                          numRating: '4.8',
                          subtext: 'Neurologist',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Health article",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ArticlePage(),
                            ),
                          );
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: const Color.fromARGB(255, 3, 190, 150),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                article(
                  image: "images/article1.png",
                  dateText: "Jun 10, 2021 ",
                  duration: "5min read",
                  mainText:
                      "The 10 Healthiest Fruits You Can Eat\nAccording to a Nutritionist",
                  onTap: () {
                    _showArticleBottomSheet(
                      context,
                      "The 10 Healthiest Fruits You Can Eat According to a Nutritionist",
                      "1. Cranberries\nLow in sugar, high in fiber, good source of Vitamin C, may help with UTIs and other health benefits.\n\n2. Apples\nRich in fiber, vitamins, and antioxidants, may lower risk of chronic disease.\n\n3. Mangoes\nHigh in Vitamin C, fiber, and antioxidants, may support immunity and digestive health.\n\n4. Blueberries\nPacked with antioxidants, may improve brain health and reduce DNA damage.\n\n5. Pineapple\nRich in Vitamin C, aids digestion and reduces inflammation.\n\n6. Avocados\nHealthy fats, fiber, and potassium, may lower cholesterol and triglyceride levels.\n\n7. Bananas\nHigh in potassium, vitamins, and minerals, may aid heart health and digestion.\n\n8. Oranges\nRich in Vitamin C, fiber, and antioxidants, supports immune function and skin health.\n\n9. Strawberries\nHigh in antioxidants and fiber, may improve heart health and lower blood sugar levels.\n\n10. Watermelon\nHydrating, low in calories, packed with antioxidants and amino acids, may reduce inflammation and improve heart health.",
                    );
                  },
                ),
              ],
            ),
          ),
          // Greeting banner
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: _showBanner ? 0 : -100, // Change this value to move the banner
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 190, 150), // Green color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Welcome back, Alex!',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const art1()));
        },
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 196, 196, 196),
        child: Image.asset("lib/icons/Doctor.png"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
