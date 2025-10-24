import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/iconic_logo.png",
                width: 24,
                height: 24,
              ),
            ),
            hintText: "Yuk cari kebutuhanmu sekarang",
            hintStyle: GoogleFonts.notoSans(color: Colors.grey),
            suffixIcon: Icon(Icons.search, size: 24),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
