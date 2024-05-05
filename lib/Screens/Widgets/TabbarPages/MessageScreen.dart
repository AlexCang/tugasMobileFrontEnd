import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Widgets/Message_all_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class message_tab_all extends StatefulWidget {
  const message_tab_all({Key? key}) : super(key: key);

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<message_tab_all>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        title: Text(
          "Messages",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("lib/icons/bell.png"),
              )),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        message_all_widget(
          image: "lib/icons/male-doctor.png",
          Maintext: "Dr. Marcus Horizon",
          subtext: "I don,t have any fever, but headchace...",
          time: "10.24",
          message_count: "2",
        ),
        message_all_widget(
          image: "lib/icons/docto3.png",
          Maintext: "Dr. Alysa Hana",
          subtext: "Hello, How can i help you?",
          time: "10.24",
          message_count: "1",
        ),
        message_all_widget(
          image: "lib/icons/doctor2.png",
          Maintext: "Dr. Maria Elena",
          subtext: "Do you have fever?",
          time: "10.24",
          message_count: "3",
        ),
      ]),
    );
  }
}