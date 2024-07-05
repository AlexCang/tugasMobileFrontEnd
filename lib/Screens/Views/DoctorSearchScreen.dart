import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/DocDetail1.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({Key? key}) : super(key: key);

  @override
  _DoctorSearchScreenState createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  List<Map<String, dynamic>> doctors = [
    {
      "distance": "800m Away",
      "image": "lib/icons/male-doctor.png",
      "maintext": "Dr. Marcus Horizon",
      "numRating": "4.7",
      "subtext": "Cardiologist",
    },
    {
      "distance": "800m Away",
      "image": "lib/icons/docto3.png",
      "maintext": "Dr. Maria Elena",
      "numRating": "4.7",
      "subtext": "Dermatologist",
    },
    {
      "distance": "800m Away",
      "image": "lib/icons/doctor2.png",
      "maintext": "Dr. Stevi Jessi",
      "numRating": "4.7",
      "subtext": "Neurologist",
    },
    {
      "distance": "800m Away",
      "image": "lib/icons/black-doctor.png",
      "maintext": "Dr. Singh",
      "numRating": "4.7",
      "subtext": "Gastroenterologist",
    },
  ];

  List<Map<String, dynamic>> displayedDoctors = [];

  @override
  void initState() {
    super.initState();
    // Initialize displayedDoctors with empty list
    displayedDoctors = [];
  }

  void _searchDoctor(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedDoctors = [];
      } else {
        displayedDoctors = doctors
            .where((doctor) =>
                doctor['maintext']
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                doctor['subtext'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToDoctorDetails(String doctorName) {
    // Navigate to DoctorDetails screen with selected doctor's data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetails(), // Pass any required data
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/icons/back1.png"),
              ),
            ),
          ),
        ),
        title: Column(
          children: [
            SizedBox(height: 1),
            Text(
              "Search Doctors",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: InkWell(
              onTap: () {
                // Handle notification icon tap
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                child: Image.asset(
                  "lib/icons/bell.png",
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
        ],
        toolbarHeight: 130,
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(),
                child: TextField(
                  onChanged: _searchDoctor,
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
            Expanded(
              child: ListView.builder(
                itemCount: displayedDoctors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToDoctorDetails(
                          displayedDoctors[index]['maintext']);
                    },
                    child: DoctorList(
                      distance: displayedDoctors[index]['distance'],
                      image: displayedDoctors[index]['image'],
                      maintext: displayedDoctors[index]['maintext'],
                      numRating: displayedDoctors[index]['numRating'],
                      subtext: displayedDoctors[index]['subtext'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
