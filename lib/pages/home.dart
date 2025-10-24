import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijau/pages/list_product.dart';
import 'package:hijau/theme.dart';
import 'package:hijau/widgets/banner_promos.dart';
import 'package:hijau/widgets/banner_widget.dart';
import 'package:hijau/widgets/menu_items.dart';
import 'package:hijau/widgets/mini_banner_promo.dart';
import 'package:hijau/widgets/notif_maps.dart';
import 'package:hijau/widgets/search_bars.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // ===== Banner sebagai background =====
                  BannerWidget(),
                  // ===== Konten di atas banner =====
                  Column(
                    children: [
                      SizedBox(height: 20),
                      // ===== Maps & Notification =====
                      NotifMaps(),
                      SizedBox(height: 20),
                      // ===== Search Bar =====
                      SearchBars(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              // ===== Menu Item Scrollable =====
              MenuItems(),

              SizedBox(height: 10),
              // Banner promo =============
              BannerPromos(),

              SizedBox(height: 10),
              // Mini banner promo ========
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Baca edukasi yuk!",
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    MiniBannerPromo(),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Tab Product
              ListProduct(),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
