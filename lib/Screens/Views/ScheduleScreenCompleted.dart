import 'package:flutter/material.dart';
import 'package:medical/Screens/Widgets/ScheduleCard.dart';

class shedule_tab1 extends StatelessWidget {
  const shedule_tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 121, 121),
      body: Column(children: [
        shedule_card(
          confirmation: "Confirmed",
          mainText: "Dr. Marcus Horizon",
          subText: "Cardiologist",
          date: "10/05/2024",
          time: "10:00 AM",
          image: "lib/icons/male-doctor.png",
        ),
        const SizedBox(
          height: 20,
        ),
        shedule_card(
          confirmation: "Confirmed",
          mainText: "Dr. Stevi Jessi",
          subText: "Neurologist",
          date: "11/05/2024",
          time: "2:00 PM",
          image: "lib/icons/doctor2.png",
        )
      ]),
    );
  }
}
