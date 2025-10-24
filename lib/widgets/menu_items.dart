import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijau/theme.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0.0;

  final List<Map<String, String>> menuList = [
    {"img": "assets/icons/ramadhan.png", "title": "Ramadhan"},
    {"img": "assets/icons/buah.png", "title": "Buah"},
    {"img": "assets/icons/daging.png", "title": "Daging"},
    {"img": "assets/icons/product_beku.png", "title": "Produk Beku"},
    {"img": "assets/icons/protein.png", "title": "Protein"},
    {"img": "assets/icons/steak.png", "title": "Steak"},
    {"img": "assets/icons/sayuran.png", "title": "Sayuran"},
    {"img": "assets/icons/unggas.png", "title": "Unggas"},
    {"img": "assets/icons/seafood.png", "title": "Seafood"},
    {"img": "assets/icons/susu_dairy.png", "title": "Susu & Dairy"},
    {"img": "assets/icons/hotpot.png", "title": "Hotpot"},
    {"img": "assets/icons/bakery.png", "title": "Bakery Sarapan"},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // Scroll Menu
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: menuList.map((item) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: menuItem(item["img"]!, item["title"]!),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: menuList.map((item) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: menuItem(item["img"]!, item["title"]!),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // === INDICATOR (DOTS) ===
            LayoutBuilder(
              builder: (context, raints) {
                double maxScroll = _scrollController.hasClients
                    ? _scrollController.position.maxScrollExtent
                    : 1;
                double scrollPercent = (maxScroll == 0)
                    ? 0
                    : (scrollPosition / maxScroll);
                int currentIndex = (scrollPercent * 4)
                    .clamp(0, 3)
                    .round(); // hitung posisi dot dari 0–3

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    bool isActive = index == currentIndex;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 20 : 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isActive ? primaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Item Menu Widget
Widget menuItem(String img, String title) {
  return InkWell(
    onTap: () => debugPrint(title),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img, width: 50, height: 50),
        SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
