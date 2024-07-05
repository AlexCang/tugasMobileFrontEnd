import 'package:flutter/material.dart';
import 'package:medical/Screens/Views/LoadingScreen.dart';
import 'package:medical/Screens/Widgets/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:medical/Screens/Login-Signup/Login.dart';
import 'package:medical/Screens/Widgets/settings.dart';
import 'package:medical/Screens/Widgets/theme.dart';
import 'package:medical/Screens/Views/appointment_provider.dart';

void main() {
  runApp(const Medics());
}

class Medics extends StatefulWidget {
  const Medics({Key? key}) : super(key: key);

  @override
  State<Medics> createState() => MedicsState();
}

class MedicsState extends State<Medics> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SettingsProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Medics',
              darkTheme: notifier.isDark ? darkTheme : lightTheme,
              themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const Screen1(),
            );
          },
        ),
      );
    });
  }
}
