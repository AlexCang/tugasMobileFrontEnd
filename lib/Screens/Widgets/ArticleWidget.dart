import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:medical/Screens/Widgets/ArticleDetailPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArticleWidget extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;
  final VoidCallback onTap;

  const ArticleWidget({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Material(
          child: ListTile(
            leading: Hero(
              tag: image, // Unique tag for each article's image
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(mainText),
            subtitle: Text('$dateText • $duration'),
          ),
        ),
      ),
    );
  }
}
