import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/HomePage.dart';
import 'package:medical/Screens/Widgets/settings.dart';
import 'package:medical/Screens/Widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
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
        title: Text('Settings',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
            )),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionHeader('Notifications'),
              customRadioTile(
                context: context,
                provider: settingsProvider,
                index: 0,
                title: 'All',
                subtitle:
                    'Receive notifications for all activities, such as newly posted articles, newly hired doctors, and messages',
              ),
              customRadioTile(
                context: context,
                provider: settingsProvider,
                index: 1,
                title: 'Important',
                subtitle:
                    'Get notified only for important interactions, such as messages',
              ),
              customRadioTile(
                context: context,
                provider: settingsProvider,
                index: 2,
                title: 'None',
                subtitle:
                    "You won't be disturbed by any notifications from the app",
              ),
              const SizedBox(height: 30),
              sectionHeader('Display'),
              ListTile(
                title: const Text('Dark Mode'),
                subtitle: Text(
                  themeProvider.isDark ? 'On' : 'Off',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                trailing: Switch(
                  value: themeProvider.isDark,
                  onChanged: (value) {
                    themeProvider.changeTheme();
                  },
                  activeColor: Theme.of(context).colorScheme.tertiary,
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }

  Widget customRadioTile({
    required BuildContext context,
    required SettingsProvider provider,
    required int index,
    required String title,
    required String subtitle,
  }) {
    return RadioListTile(
      value: provider.privacyOption[index],
      groupValue: provider.currentPrivacyOption,
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      onChanged: (value) {
        setState(() {
          provider.currentPrivacyOption = provider.privacyOption[index];
        });
      },
      activeColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
