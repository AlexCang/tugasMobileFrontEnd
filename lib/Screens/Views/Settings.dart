import 'package:flutter/material.dart';
import 'package:medical/Screens/Login-Signup/Login.dart';
import 'package:medical/Screens/Views/HomePage.dart';
import 'package:medical/Screens/Widgets/settings.dart';
import 'package:medical/Screens/Widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

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
        leading: IconButton(
          icon: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset("lib/icons/back2.png")),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight, child: Homepage()));
          },
        ),
        title: const Text('Notifications'),
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              RadioListTile(
                value: settingsProvider.privacyOption[0],
                groupValue: settingsProvider.currentPrivacyOption,
                title: const Text('All'),
                subtitle: Text(
                  'Receive notifications for all activities, such as newly posted articles, newly hired doctors, and messages',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onChanged: (value) {
                  setState(() {
                    settingsProvider.currentPrivacyOption =
                        settingsProvider.privacyOption[0];
                  });
                },
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
              RadioListTile(
                value: settingsProvider.privacyOption[1],
                groupValue: settingsProvider.currentPrivacyOption,
                title: const Text('Important'),
                subtitle: Text(
                  'Get notified only for important interactions, such as messages',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onChanged: (value) {
                  setState(() {
                    settingsProvider.currentPrivacyOption =
                        settingsProvider.privacyOption[1];
                  });
                },
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
              RadioListTile(
                value: settingsProvider.privacyOption[2],
                groupValue: settingsProvider.currentPrivacyOption,
                title: const Text('None'),
                subtitle: Text(
                  "You won't be disturbed by any notifications from the app",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onChanged: (value) {
                  setState(() {
                    settingsProvider.currentPrivacyOption =
                        settingsProvider.privacyOption[2];
                  });
                },
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(height: 30),
              const Text(
                'Display',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              ListTile(
                leading: themeProvider.isDark
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
                title: const Text('Dark Mode'),
                subtitle: themeProvider.isDark
                    ? Text(
                        'On',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      )
                    : Text(
                        'Off',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
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
}
