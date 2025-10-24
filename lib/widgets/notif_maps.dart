import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifMaps extends StatelessWidget {
  const NotifMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.location_on_rounded, size: 24, color: Colors.white),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dikirim ke Planet Jupiter",
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Hari ini 1 bulan sampai",
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Icon(Icons.notifications, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
