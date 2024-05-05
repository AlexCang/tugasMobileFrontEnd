import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Login-Signup/ForgotPass.dart';
import 'package:medical/Screens/Login-Signup/register.dart';
import 'package:medical/Screens/Views/HomePage.dart';
import 'package:medical/Screens/Widgets/Auth_text_field.dart';
import 'package:medical/Screens/Widgets/Auth_social_login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class login extends StatelessWidget {
  const login({Key? key});

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Login",
          style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          // Text field Login import from Auth_text_field widget
          Auth_text_field(
              text: "Enter your email",
              icon: "lib/icons/email.png",
              controller: emailController),
          const SizedBox(
            height: 5,
          ),
          // Text field Password
          // Text field Password
          Auth_text_field(
            text: "Enter your password",
            icon: "lib/icons/lock.png",
            controller: passwordController,
            obscureText: true, // Set obscureText to true
          ),

          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const forgot_pass()));
              },
              child: Text(
                "Forgot your password?",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: const Color.fromARGB(255, 3, 190, 150),
                    fontWeight: FontWeight.w500),
              ),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                // Perform verification or other actions here
                String enteredEmail = emailController.text.trim();
                String enteredPassword = passwordController.text.trim();
                if (enteredEmail == email && enteredPassword == password) {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: Homepage()));
                } else {
                  // Show an error message or handle invalid credentials
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Invalid Credentials"),
                        content:
                            Text("Please enter correct email and password."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 3, 190, 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Login",
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
                "Don't have an account? ",
                style:
                    GoogleFonts.poppins(fontSize: 15.sp, color: Colors.black87),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const register()));
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: const Color.fromARGB(255, 3, 190, 150),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "or",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          auth_social_logins(
              logo: "images/google.png", text: "Sign in with Google"),
          const SizedBox(
            height: 20,
          ),
          auth_social_logins(logo: "images/apple.png", text: "Sign in Apple"),
          const SizedBox(
            height: 20,
          ),
          auth_social_logins(
              logo: "images/facebook.png", text: "Sign in facebook")
        ]),
      ),
    );
  }
}
