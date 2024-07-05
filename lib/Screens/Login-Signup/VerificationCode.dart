import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Login-Signup/Login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class verification_code extends StatelessWidget {
  const verification_code({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8), // Padding around the image
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
                  .withOpacity(0.3), // Background color behind the image
            ),
            child: Image.asset(
              "lib/icons/back1.png",
              width: 30, // Adjust the size of the image
              height: 30,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight, child: login()));
          },
        ),
        backgroundColor: theme.colorScheme.surface,
        toolbarHeight: 80,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Forgot your password?",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Enter verification code we have sent to your\nnumber",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(241, 245, 245, 245),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0), // Adjust horizontal padding as desired
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      counterText: '', // Set counterText to an empty string
                      contentPadding:
                          EdgeInsets.zero, // Set contentPadding to zero
                    ),
                    maxLength: 1,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black), // Adjust font size as desired
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(241, 245, 245, 245),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0), // Adjust horizontal padding as desired
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      counterText: '', // Set counterText to an empty string
                      contentPadding:
                          EdgeInsets.zero, // Set contentPadding to zero
                    ),
                    maxLength: 1,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black), // Adjust font size as desired
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(241, 245, 245, 245),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0), // Adjust horizontal padding as desired
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      counterText: '', // Set counterText to an empty string
                      contentPadding:
                          EdgeInsets.zero, // Set contentPadding to zero
                    ),
                    maxLength: 1,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black), // Adjust font size as desired
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(241, 245, 245, 245),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0), // Adjust horizontal padding as desired
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      counterText: '', // Set counterText to an empty string
                      contentPadding:
                          EdgeInsets.zero, // Set contentPadding to zero
                    ),
                    maxLength: 1,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black), // Adjust font size as desired
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                // Perform verification or other actions here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 3, 190, 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Verify",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't recieve code yet? ",
                style: GoogleFonts.poppins(fontSize: 15.sp),
              ),
              Text(
                "Resend",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: const Color.fromARGB(255, 3, 190, 150),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
