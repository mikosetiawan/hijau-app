import 'package:flutter/material.dart';

class MiniBannerPromo extends StatefulWidget {
  const MiniBannerPromo({super.key});

  @override
  State<MiniBannerPromo> createState() => _MiniBannerPromoState();
}

class _MiniBannerPromoState extends State<MiniBannerPromo> {
  // ignore: non_constant_identifier_names
  final List<String> EdukasiItem = [
    'assets/images/camilan_fly.png',
    'assets/images/fruit_paradise_fly.png',
    'assets/images/min_segar_fly.png',
    'assets/images/ramadhan_fly.png',
    'assets/images/steart_food_fly.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: EdukasiItem.map((img) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: EdukasiItemWidget(img),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EdukasiItemWidget extends StatelessWidget {
  final String img;

  const EdukasiItemWidget(this.img, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint(img),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          img,
          width: 100, // bisa disesuaikan
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
