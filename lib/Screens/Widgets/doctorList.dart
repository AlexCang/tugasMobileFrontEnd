import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorList extends StatelessWidget {
  final String image;
  final String maintext;
  final String subtext;
  final String numRating;
  final String distance;

  const DoctorList({
    Key? key,
    required this.distance,
    required this.image,
    required this.maintext,
    required this.numRating,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: 14.h,
          width: 90.w,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border.all(color: const Color.fromARGB(255, 226, 226, 226)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              // Doctor image Container
              Container(
                height: 12.h,
                width: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 12.h,
                width: 40.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maintext,
                      style: GoogleFonts.poppins(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtext,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          height: 1.5.h,
                          width: 8.w,
                          color: const Color.fromARGB(255, 240, 236, 236),
                          child: Row(
                            children: [
                              Container(
                                height: 1.5.h,
                                width: 3.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("lib/icons/star.png"),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                              Text(
                                numRating,
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: const Color.fromARGB(255, 4, 179, 120),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          height: 1.5.h,
                          width: 3.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/icons/Location.png"),
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          distance,
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
